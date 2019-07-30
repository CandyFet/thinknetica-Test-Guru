# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([
                  { title: 'HTML' },
                  { title: 'Ruby' },
                  { title: 'Rails' },
                  { title: 'CSS' }
                ])

Test.create([
              { title: 'First lesson', level: 1, category_id: 1 },
              { title: 'Second lesson', level: 2, category_id: 1 },
              { title: 'First lesson', level: 1, category_id: 2 },
              { title: 'First lesson', level: 1, category_id: 3 },
              { title: 'First lesson', level: 1, category_id: 4 }
            ])

Question.create([
                  { body: 'What is tag?', test_id: 1 },
                  { body: 'Meaning of <p> tag', test_id: 1 },
                  { body: 'Meaning of <ul> tag', test_id: 2 },
                  { body: 'Meaning of <ol> tag', test_id: 2 },
                  { body: 'How to print a string in console?', test_id: 3 },
                  { body: 'What is MVC?', test_id: 4 },
                  { body: 'Why we need to use CSS?', test_id: 5 }
                ])

Answer.create([
                {
                  body: 'This is hidden keyword within a web page that define how your web browser must format and display the content',
                  correct: true,
                  question_id: 1
                },
                {
                  body: 'Parapgraph',
                  correct: true,
                  question_id: 2
                },
                {
                  body: 'Unordered list',
                  correct: true,
                  question_id: 3
                },
                {
                  body: 'Ordered list',
                  correct: true,
                  question_id: 4
                },
                {
                  body: "Use 'puts' command",
                  correct: true,
                  question_id: 5
                },
                {
                  body: 'Model-View-Controller architectural pattern',
                  correct: true,
                  question_id: 6
                },
                {
                  body: 'We need it to manage position of HTML tags on web-page',
                  correct: true,
                  question_id: 7
                }
              ])

User.create([
              { login: 'admin@example.com', name: 'Admin', password: '123' },
              { login: 'user1@example.com', name: 'User1', password: '123' },
              { login: 'user2@example.com', name: 'User2', password: '123' }
            ])

UserTest.create([
                  { user_id: 1, test_id: 1 },
                  { user_id: 1, test_id: 2 },
                  { user_id: 1, test_id: 3 },
                  { user_id: 1, test_id: 4 },
                  { user_id: 1, test_id: 5 },
                  { user_id: 2, test_id: 1 },
                  { user_id: 2, test_id: 2 },
                  { user_id: 3, test_id: 1 }
                ])
