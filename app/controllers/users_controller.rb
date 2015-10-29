enable :sessions



get "/users/signup" do
  @signup = true
  erb :"/users/session"
end

post "/users" do
  @user = User.create!(email: params[:email], password: params[:password], username: params[:email])
  #TELL THEM ABOUT THEIR REGISTRATION ERROR
  redirect "/users/login"
end

post "/user/find" do
  user = User.find_by(username: params['username'])
  redirect "/users/#{user.id}" if user
  redirect ('/users')
end

get "/users/login" do
  @login = true
  erb :"/users/session"
end

post "/users/login" do
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
  @logout = true
  erb :"users/session"
end

post "/users/logout" do
  clear_session_variables
  redirect "/"
end



#updates a specific user
put "/users/:id" do
  #do we need this? only if user will have profile edit functionality
end

get "/users" do
  @user = User.get_index_info
  @active_tab = 'reputation'
  erb :"/users/index"
end

get "/users/new" do
  @user = User.get_index_info
  @active_tab = 'new'
  erb :"/users/index"
end

get "/users/voters" do
  @user = User.get_index_info
  @active_tab = 'voters'
  erb :"/users/index"
end

get "/users/editors" do
  @user = User.get_index_info
  @active_tab = 'editors'
  erb :"/users/index"
end

get "/users/moderators" do
  @user = User.get_index_info
  @active_tab = 'moderators'
  erb :"/users/index"
end


delete "/users/:id" do
  @user = User.find(params[:id])
  @user.destroy
  erb :index
end

get "/users/:id" do
  @user = User.find_by(id: params[:id])
  erb :"/users/profile"
end


