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

#creates a new user
post "/users" do
  @user = User.create!(email: params[:email], password: params[:password], username: params[:email])
end

#retrieve a specific user
get "/users/:id" do

end

#updates a specific user
put "/users/:id" do

end

#destroys a specific user
delete "/users/:id" do

end



#logs a user in
post "/users/login" do

end

#retrieves logout view
get "/users/logout" do

end

#logs a user out
get "/users/logout" do
end
