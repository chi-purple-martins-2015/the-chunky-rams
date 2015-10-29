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

  def self.get_index_info
    @user_info = []
    User.limit(50).offset(rand(1..100)).each do |user|
      single_user = {}
      single_user[:id] = user.id
      single_user[:image] = user.path_to_profile_image
      single_user[:username] = user.username
      single_user[:location] = "#{Faker::Address.city}, #{Faker::Address.country}"[0..30]
      single_user [:votes] = rand(1..1200)
      tags = []
      rand(1..3).times do
        tags << Tag.find_by(id: rand(1..100))
      end
      single_user[:tags] = tags
      @user_info << single_user
    end
    @user_info
  end


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
