class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :comment]
  def index
    @blogs = Blog.order(id: :desc).page(params[:page]).per(params[:per_page])
  end

  def new
    @blog = Blog.new
  end

  def show
    @comments = @blog.comments.page(params[:page]).per(params[:per_page])
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      flash[:success] = '创建成功'
      redirect_to blogs_path
    else
      flash[:error] = "创建失败,#{@blog.errors.full_messages}"
      render "new"
    end
  end

  def comment
    @comment = @blog.comments.new(comment_params.merge(user_id: current_user.id))

    if @comment.save
      flash[:success] = '创建成功'
      redirect_to blog_path(@blog)
    else
      flash[:error] = "创建失败,#{@comment.errors.full_messages}"
      render "new"
    end
  end
  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  def comment_params
    params.require(:comment).permit(:content)
  end
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
