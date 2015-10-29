enable :sessions

get "/users" do
  erb :"/users/index"
end

get "/users/signup" do
  @signup = true
  erb :"/users/session"
end

post "/users" do
  @user = User.create!(email: params[:email], password: params[:password], username: params[:email])
  #TELL THEM ABOUT THEIR REGISTRATION ERROR
end

get "/users/login" do
  erb :"/users/session"
end

post "/users/login" do
  puts "STUFFF!"
  p params
  @user = User.authenticate(params[:email], params[:password])
  if @user
    set_session_variables(@user)
    redirect "/users/#{session[:id]}"
  else
    #TELL THEM ABOUT THEIR LOGIN ERROR
    redirect "/users/login"
  end
end

get "/users/logout" do
  erb :"users/session"
end

post "/users/logout" do
  clear_session_variables
  erb :index
end

#retrieve a specific user
get "/users/:id" do
  erb :"/users/profile"
end

#updates a specific user
put "/users/:id" do
  #do we need this? only if user will have profile edit functionality
end

#destroys a specific user
delete "/users/:id" do
  @user = User.find(params[:id])
  @user.destroy
  erb :index
end


