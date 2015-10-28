class Question < ActiveRecord::Base
  has_many :categories
  has_many :tags, through: :categories
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
end
