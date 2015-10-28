class Question < ActiveRecord::Base
  has_many :categories
  has_many :tags, through: :categories
end
