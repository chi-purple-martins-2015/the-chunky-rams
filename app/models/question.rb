class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :categories
  has_many :tags, through: :categories
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  def excerpt
    self.body[0..200]
  end

  def points
    # self.votes.
  end

  def num_answers
    self.answers.count
  end
end
