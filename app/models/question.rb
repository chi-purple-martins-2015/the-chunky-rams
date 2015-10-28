class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :categories
  has_many :tags, through: :categories
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
end
