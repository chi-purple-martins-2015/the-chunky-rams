class Tag < ActiveRecord::Base
  has_many :categories
  has_many :questions, through: :categories
end
