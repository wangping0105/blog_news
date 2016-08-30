class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :blogs
  # has_secure_password

  validates_uniqueness_of :email, :message => "邮箱已经存在!"
  validates_presence_of :email, :message => "邮箱不能为空!"
  validates_presence_of :name, :message => "用户名不能为空!"
  validates_presence_of :password, :message => "邮箱不能为空!"
  validates_format_of  :email, :message => "邮箱格式不正确!", :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def admin?
    if role == 'super_admin'
      return true
    end
    false
  end

end
