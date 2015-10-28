get '/tags' do

  @tags = Tag.all

  erb :'tags/popular'
end


get '/tags/new' do
"hello buddy new"
  @tags = Tag.all

  erb :'tags/new'
end



get '/tags/name' do
"hello buddy name"
  @tags = Tag.all

  erb :'tags/name'
end

