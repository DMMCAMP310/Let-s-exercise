# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email:"admin@example.jp",password:"123456")

weeks = [
  "月",
  "火",
  "水",
  "木",
  "金",
  "土",
  "日",]

weeks.length.times do |i|
  Week.create!(
    name: weeks[i]
  )
end