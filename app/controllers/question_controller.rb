get "/questions" do
  @questions = Question.find(:all, limit: 15)
  erb :"questions/index"
end

get "/questions/:id" do
  @question = Question.find_by(id: params[:id])
  erb :"questions/show"
end
