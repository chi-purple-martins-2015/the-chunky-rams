helpers do
  def find_username(id)
    User.find_by(id: id).username
  end

  def format_time(timestamp)
    timestamp.strftime('%B %e, %Y at %I:%M')
  end

  # def make_new_vote(question)
  #
  # end

  def get_vote_value(vote_type)
    if vote_type == "upvote"
      return 1
    elsif vote_type == "downvote"
      return -1
    end
  end
end
