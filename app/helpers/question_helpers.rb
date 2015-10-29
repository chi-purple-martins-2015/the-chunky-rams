helpers do
  def find_username(id)
    User.find_by(id: id).username
  end

  def has_tags(question)
    question.tags.count != 0
  end
end
