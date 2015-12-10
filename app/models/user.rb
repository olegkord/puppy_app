require 'securerandom'

class User < ActiveRecord::Base
  before_create :set_auth_token

  has_many :posts
  has_many :comments

  validates :password, presence: true
  validates :password, length: {minimum: 4}

  validates :user_name, presence: true
  validates :user_name, uniqueness: true

  validates :email, presence: true
  validates :email, uniqueness: true

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  private
    def set_auth_token
      return if auth_token.present?
      self.auth_token = generated_auth_token
    end

    def generated_auth_token
      SecureRandom.uuid.gsub(/\-/,'')
    end
end
