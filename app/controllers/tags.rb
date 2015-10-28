get '/tags' do

  @tags = Tag.all.sort_by{ |tag| tag.questions.count}.reverse



  erb :'tags/popular'
end


get '/tags/new' do
  @tags = Tag.all.order(created_at: :desc)

  erb :'tags/new'
end



get '/tags/name' do
  @tags = Tag.all.order(name: :desc)

  erb :'tags/name'
end

