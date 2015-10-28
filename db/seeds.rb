require 'faker'

100.times do
  rand(1..5).times do |index|
  User.create(username: (Faker::Name.first_name + index.to_s), email: Faker::Internet.email, hashed_password: Faker::Internet.password).questions.create(title: (['Problem with', 'Question about', 'Need help with', 'Wondering about', 'Confused about'].sample + ' ' + Faker::Hacker.adjective + ' ' + Faker::Hacker.noun), body: (['I have a problem with', 'I have a question about', 'I need help with', 'I am wondering about', 'Confused about'].sample + ' ' + Faker::Hacker.adjective + ' ' + Faker::Hacker.noun + '.'))
  Tag.create(name: Faker::Hacker.adjective)
  end
end

User.all.each do |user|
  user.answers.create(body: Faker::Hacker.say_something_smart)
end

Question.each do |question|
  rand(1..5).times do
    question.last.comments.create(body: Faker::Hacker.say_something_smart)
  end
end


100.times do
  Category.create(tag_ig: Tag.all.sample.id, question_id: Question.all.sample.id)
end

200.times do
  if rand(1..2).odd?
    Question.all.sample.votes.create(user_id: User.all.sample.id)
  else
    Answer.all.sample.votes.create(user_id: User.all.sample.id)
  end
end




