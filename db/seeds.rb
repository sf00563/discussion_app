# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
DiscussionTopic.destroy_all

DiscussionTopic.create!([{
  topic: "Sport"
},
{
  topic: "Food"
},
{
  topic: "Relationships"
},
{
  topic: "Health"
},
{
  topic: "News"
},
{
  topic: "Other"
}])


p "Created #{DiscussionTopic.count} discussion topics"
