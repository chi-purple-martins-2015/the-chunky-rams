helpers do
  def find_username(id)
    User.find_by(id: id).username
  end

  def format_time(timestamp)
    timestamp.strftime('%B %e, %Y at %I:%M')
  end
end
