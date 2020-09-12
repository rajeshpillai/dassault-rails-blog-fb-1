# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tag.delete_all 
Category.delete_all

# create will immediately persist the record to the DB
Tag.create(name: "javascript")
Tag.create(name: "react")
Tag.create(name: "ruby")
Tag.create(name: "rails")


Category.create(
    name: "Web Development", 
    description: "All about web development"
)

Category.create(
  name: "Programming", 
  description: "All about programming"
)

Category.create(
  name: "JavaScript", 
  description: "All about javascript"
)



