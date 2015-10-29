class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  def score
    if self.votes.count == 0
      return 0
    else self.votes.sum("vote_value")
    end
  end

end
