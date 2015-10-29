enable :sessions

helpers do

  def set_session_variables(user)
    session[:id] = user.id
    session[:username] = user.username
    session[:email] = user.email
  end

  def clear_session_variables
    session[:id] = nil
    session[:username] = nil
    session[:email] = nil
  end

  def logged_in?
    session[:id] != nil
  end
end
