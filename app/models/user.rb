class User < ActiveRecord::Base
  has_many :blogs
  has_secure_password

  validates_uniqueness_of :email, :message => "邮箱已经存在!"
  validates_presence_of :email, :message => "邮箱不能为空!"
  validates_presence_of :name, :message => "用户名不能为空!"
  validates_presence_of :password, :message => "邮箱不能为空!"
  validates_format_of  :email, :message => "邮箱格式不正确!", :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def generate_authentication_token
    loop do
      self.authentication_token = User.encrypt(User.new_authentication_token)
      break if !User.find_by(authentication_token: authentication_token)
    end
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def admin?
    if role == 'super_admin'
      return true
    end
    false
  end

  def update_authentication_token
    generate_authentication_token
    self.save!
  end

  def self.new_authentication_token
    SecureRandom.urlsafe_base64
  end

  private
  def create_authentication_token
    self.authentication_token = User.encrypt(User.new_authentication_token)
  end
end
