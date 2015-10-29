
100.times do
  rand(1..5).times do |index|

  User.create(username: (Faker::Name.first_name + index.to_s), email: Faker::Internet.email, path_to_profile_image: Faker::Avatar.image("my-own-slug", "50x50"), hashed_password: Faker::Internet.password).questions.create(title: (['Problem with', 'Question about', 'Need help with', 'Wondering about', 'Confused about'].sample + ' ' + Faker::Hacker.adjective + ' ' + Faker::Hacker.noun), views: rand(1..1000), body: (['I have a problem with', 'I have a question about', 'I need help with', 'I am wondering about', 'Confused about'].sample + ' ' + Faker::Hacker.adjective + ' ' + Faker::Hacker.noun + '.'))
  Tag.create(name: Faker::Hacker.adjective, description: Faker::Hacker.say_something_smart)

  User.create(username: (Faker::Name.first_name + index.to_s), email: Faker::Internet.email, path_to_profile_image: Faker::Avatar.image("my-own-slug", "50x50"), password: 'password').questions.create(title: (['Problem with', 'Question about', 'Need help with', 'Wondering about', 'Confused about'].sample + ' ' + Faker::Hacker.adjective + ' ' + Faker::Hacker.noun), views: rand(1..1000), body: (['I have a problem with', 'I have a question about', 'I need help with', 'I am wondering about', 'Confused about'].sample + ' ' + Faker::Hacker.adjective + ' ' + Faker::Hacker.noun + '.'))
  Tag.create(name: Faker::Hacker.adjective, description: Faker::Hacker.say_something_smart)
  end
end

User.all.each do |user|
  user.answers.create(body: Faker::Hacker.say_something_smart)
  user.update_attributes(path_to_profile_image: user.path_to_profile_image.gsub('my-own-slug', user.id.to_s))
end

Question.all.each do |question|
  rand(1..5).times do
    question.comments.create(body: Faker::Hacker.say_something_smart, user_id: User.all.sample.id)
  end
end

Answer.all.each { |answer| answer.update_attributes(question_id:  Question.all.sample.id) }

100.times do
  Category.create(tag_id: Tag.all.sample.id, question_id: Question.all.sample.id)
end

200.times do
  if rand(1..3) == 1
    vote_value = -1
  else vote_value = 1
  end

  if rand(1..2).odd?
    Question.all.sample.votes.create(user_id: User.all.sample.id, vote_value: vote_value)
  else
    Answer.all.sample.votes.create(user_id: User.all.sample.id, vote_value: vote_value)
  end
end
