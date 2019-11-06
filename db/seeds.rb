# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 10.times do |n|
#  Task.create(title: "おっさん",content: "N国", status: "完了",  priority: "高")
# end
# 10.times do |n|
#  Task.create(title: "おっさん",content: "N国", status: "未着手",  priority: "低")
# end
# 10.times do |n|
#  Task.create(title: "おっさん",content: "N国", status: "未完了",  priority: "低")
# end
# 10.times do |n|
#  Task.create(title: "おっさん",content: "N国", status: "未完了",  priority: "低", expiration_date: "2")
# end

User.create!(name:  "管理者",
            email: "787@gmail.com",
            password:  "787@gmail.com",
            password_confirmation: "787@gmail.com",
            admin: true)
