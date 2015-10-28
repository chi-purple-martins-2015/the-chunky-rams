require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  validates :username, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :hashed_password, presence: true

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(params)
    if User.exists?(email: params[:email])
      @user = User.find_by(email: params[:email])
      @user.password == params[:password] ? @user : false
      @user
    else
      false
    end
  end
end
