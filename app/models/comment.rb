class Comment < ActiveRecord :: Base

  belongs_to :user
  belongs_to :post

  validates :content, presence: true
  validates :content, length: {in: 5..140}
  
end
