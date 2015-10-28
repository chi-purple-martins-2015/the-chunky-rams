get '/tags' do

  @tags = Tag.all

  erb :'tags/popular'
end


get '/tags/new' do
  @tags = Tag.all

  erb :'tags/new'
end



get '/tags/name' do
  @tags = Tag.all

  erb :'tags/name'
end

