get "/" do
  @questions = Question.limit(10)
  erb :'questions/index'
end
