# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create!([
                         { login: 'admin@example.com', name: 'Admin', password: '123', email: 'admin@example.com' },
                         { login: 'user1@example.com', name: 'User1', password: '123', email: 'user1@example.com' },
                         { login: 'user2@example.com', name: 'User2', password: '123', email: 'user2@example.com' }
                     ])

categories = Category.create!([
                                { title: 'HTML' },
                                { title: 'Ruby' },
                                { title: 'Rails' },
                                { title: 'CSS' }
                              ])

tests = Test.create!([
                       { title: 'First lesson HTML', level: 1, category: categories.first, creator_id: users.first.id },
                       { title: 'Second lesson HTML', level: 2, category: categories.first, creator_id: users.first.id },
                       { title: 'First lesson Ruby', level: 1, category: categories[1], creator_id: users.first.id },
                       { title: 'First lesson Rails', level: 1, category: categories[2], creator_id: users.first.id },
                       { title: 'First lesson CSS', level: 1, category: categories.last, creator_id: users.first.id }
                     ])

questions = Question.create!([
                               { body: 'What is tag?', test: tests.first },
                               { body: 'Meaning of <p> tag', test: tests.first },
                               { body: 'Meaning of <ul> tag', test: tests[1] },
                               { body: 'Meaning of <ol> tag', test: tests[1] },
                               { body: 'How to print a string in console?', test: tests[2] },
                               { body: 'What is MVC?', test_id: tests[3].id },
                               { body: 'Why we need to use CSS?', test: tests.last }
                             ])

answers = Answer.create!([
                           {
                             body: 'This is hidden keyword within a web page that define how your web browser must format and display the content',
                             correct: true,
                             question_id: questions.first.id
                           },
                           {
                             body: 'Parapgraph',
                             correct: true,
                             question_id: questions[1].id
                           },
                           {
                             body: 'Unordered list',
                             correct: true,
                             question_id: questions[2].id
                           },
                           {
                             body: 'Ordered list',
                             correct: true,
                             question_id: questions[3].id
                           },
                           {
                             body: "Use 'puts' command",
                             correct: true,
                             question_id: questions[4].id
                           },
                           {
                             body: 'Model-View-Controller architectural pattern',
                             correct: true,
                             question_id: questions[5].id
                           },
                           {
                             body: 'We need it to manage position of HTML tags on web-page',
                             correct: true,
                             question_id: questions.last.id
                           }
                         ])



users.each do |user|
  tests.each do |test|
    user.tests.push(test)
    user.save
  end
end


