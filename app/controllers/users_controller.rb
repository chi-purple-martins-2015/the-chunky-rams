enable :sessions

#retrieves a list of users
get "/users" do

end

#retrieves signup user view
get "/users/signup" do
  @signup = true
  erb :"/users/session"
end

#retrieves login view
get "/users/login" do
  erb :"/users/session"
end

#logs a user in
post "/users/login" do
  @user = User.authenticate(params)
  if @user
    session[:id] = @user.id
    redirect "/users/#{session[:id]}"
  else
    #TELL THEM ABOUT THEIR LOGIN ERROR
    redirect "/users/login"
  end
end

#creates a new user
post "/users" do
  @user = User.create!(email: params[:email], password: params[:password], username: params[:email])
  #TELL THEM ABOUT THEIR REGISTRATION ERROR

end

#retrieve a specific user
get "/users/:id" do
  erb :"/users/profile"
end

#updates a specific user
put "/users/:id" do

end

#destroys a specific user
delete "/users/:id" do

end

#retrieves logout view
get "/users/logout" do

end

#logs a user out
get "/users/logout" do
end
