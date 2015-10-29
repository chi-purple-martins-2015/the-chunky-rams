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

  def self.authenticate(email, password)
    if User.exists?(email: email)
      @user = User.find_by(email: email)
      puts "MORE STUFF"
      p @user.password
      if @user.password == password
        return @user
      else
        return false
      end
    end
  end
end
