class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  validates :img_url, presence: true
  validates_format_of :img_url, with: => /\Ahttp:/

  validates :title, presence: true
  validates :title, length: {in: 5..70}

  validates :content, presence: true
  validates :content, length: {in: 5..140}
end
