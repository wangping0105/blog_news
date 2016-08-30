class SessionsController < ApplicationController
  layout 'sessions'

  skip_before_action :authenticate_user!, except: [:destroy]
  def index
    @user = User.new
  end

  def new
    @user = User.new
  end

  def login
    @user = User.find_by(email: user_params[:email])
    if @user && @user.authenticate(user_params[:password])
      sign_in(@user)
      # flash[:success] = '登录成功'
      # redirect_to blogs_path
      data = {code: 0, msg: "登录成功", url: blogs_path}
    else
      # flash[:danger] = '账户密码不正确，请重试!'
      # redirect_to  root_path
      data = {code: -1, msg: "账户密码不正确，请重试!"}
    end

    render json: data
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = '创建成功'
      redirect_to root_path
    else
      flash[:error] = "创建失败,#{@user.errors.full_messages}"
      render "new"
    end
  end

  def destroy

    redirect_to sessions_path
  end
  private
  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
