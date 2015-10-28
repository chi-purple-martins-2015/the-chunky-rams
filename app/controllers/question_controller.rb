get "/questions" do
  @questions = Question.find(:all, limit: 15)
  erb :"questions/index"
end

get "/questions/:id" do

  erb :"questions/show"
end
