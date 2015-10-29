get "/questions" do
  @questions = Question.limit(15)
  erb :"questions/index"
end

get "/questions/:id" do
  @question = Question.find_by(id: params[:id])
  @question_author = User.find_by(id: @question.user_id)
  @answers = @question.answers
  erb :"questions/show"
end
