class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :categories
  has_many :tags, through: :categories
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  def points
    self.votes.count
  end

  def num_answers
    self.answers.count
  end
end
