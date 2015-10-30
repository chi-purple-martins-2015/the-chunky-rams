get "/answers/:id/votes/:vote_type" do
  vote_value = get_vote_value(params[:vote_type])
  if session[:id]
    user_id = session[:id]
  else user_id = rand(1..100)
  end

  answer = Answer.find_by(id: params[:id])
  answer.votes.create(user_id: user_id, votable_type: "Answer", votable_id: answer.id, vote_value: vote_value)
  redirect "/questions/#{answer.question_id}"
end
