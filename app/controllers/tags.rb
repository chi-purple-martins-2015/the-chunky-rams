get '/tags' do

  @tags = Tag.all.sort_by{ |tag| tag.questions.count}.reverse



  erb :'tags/popular'
end


get '/tags/new' do
  @tags = Tag.all.order(created_at: :desc)

  erb :'tags/new'
end

post '/tags/find' do
  tag = Tag.find_by(name: params['tagname'])
  redirect "/tags/#{tag.id}" if tag
  redirect '/tags'
end


get '/tags/name' do
  @tags = Tag.all.order(name: :asc)

  erb :'tags/name'
end

