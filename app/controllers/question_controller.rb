get "/questions" do
  @questions = Question.limit(15)
  erb :"questions/index"
end

get "/questions/:id" do
  @question = Question.find_by(id: params[:id])
  @answers = Question.answers
  erb :"questions/show"
end
