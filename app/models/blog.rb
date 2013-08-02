class Blog < ActiveRecord::Base
  attr_accessible :content, :title
  validates :user_id, :content, presence: true
  validates :title, presence: true, length: {maximum: 140}

  belongs_to :user

  default_scope order: 'blogs.created_at DESC'


end
