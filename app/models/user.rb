
class User < ActiveRecord::Base

  has_many :posts
  has_many :comments

  validates :password, presence: true
  validates :password, length: {minimum: 4}

  validates :user_name, presence: true
  validates :user_name, uniqueness: true

  validates :email, presence: true
  validates :email, uniqueness: true

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create


end
