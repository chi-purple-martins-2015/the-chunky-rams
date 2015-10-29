helpers do
  def find_username(id)
    User.find_by(id: id).username
  end
end
