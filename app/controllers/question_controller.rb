get "/questions" do
  @questions = Question.all
  erb :"questions/index"
end

get "/questions/:id" do

  erb :"questions/show"
end
