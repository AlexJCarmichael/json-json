# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


5.times do
  user = User.create!(name: Faker::Name.name)
  rand(1..10).times do
    Post.create!(title: Faker::Hipster.sentence(3, false, 4), body: Faker::Hipster.paragraph(2, false, 8), user_id: user.id)
  end
end
