class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates_presence_of       :title, :message => "标题不能为空!"
  validates_presence_of       :content, :message => "内容不能为空!"
  validates_length_of           :title, :minimum => 5,   :message => "标题最少5个字!"
  validates_length_of           :title, :maximum => 20,   :message => "标题最少5个字!"

end
