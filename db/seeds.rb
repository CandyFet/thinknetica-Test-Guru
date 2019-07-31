# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([
                                { title: 'HTML' },
                                { title: 'Ruby' },
                                { title: 'Rails' },
                                { title: 'CSS' }
                              ])

tests = Test.create!([
                       { title: 'First lesson', level: 1, category_id: categories.first.id },
                       { title: 'Second lesson', level: 2, category_id: categories.first.id },
                       { title: 'First lesson', level: 1, category_id: categories[1].id },
                       { title: 'First lesson', level: 1, category_id: categories[2].id },
                       { title: 'First lesson', level: 1, category_id: categories.last.id }
                     ])

questions = Question.create!([
                               { body: 'What is tag?', test_id: tests.first.id },
                               { body: 'Meaning of <p> tag', test_id: tests.first.id },
                               { body: 'Meaning of <ul> tag', test_id: tests[1].id },
                               { body: 'Meaning of <ol> tag', test_id: tests[1].id },
                               { body: 'How to print a string in console?', test_id: tests[2].id },
                               { body: 'What is MVC?', test_id: tests[3].id },
                               { body: 'Why we need to use CSS?', test_id: tests.last.id }
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

users = User.create!([
                       { login: 'admin@example.com', name: 'Admin', password: '123' },
                       { login: 'user1@example.com', name: 'User1', password: '123' },
                       { login: 'user2@example.com', name: 'User2', password: '123' }
                     ])

UserTest.create!([
                   { user_id: users.first.id, test_id: tests.first.id },
                   { user_id: users.first.id, test_id: tests[1].id },
                   { user_id: users.first.id, test_id: tests[2].id },
                   { user_id: users.first.id, test_id: tests[3].id },
                   { user_id: users.first.id, test_id: tests.last.id },
                   { user_id: users[1].id, test_id: tests.first.id },
                   { user_id: users[1].id, test_id: test[1].id },
                   { user_id: users.last.id, test_id: tests.first.id }
                 ])

