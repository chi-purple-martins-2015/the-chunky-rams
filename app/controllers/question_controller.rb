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

get "/questions/:id/votes/:vote_type" do
  vote_value = get_vote_value(params[:vote_type])
  if session[:id]
    user_id = session[:id]
  else user_id = rand(1..100)
  end

  question = Question.find_by(id: params[:id])
  question.votes.create(user_id: user_id, votable_type: "Question", votable_id: question.id, vote_value: vote_value)
  redirect "/questions/#{params[:id]}"
end
