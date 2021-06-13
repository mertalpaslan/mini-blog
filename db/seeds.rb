# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

body_text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin iaculis lectus porta risus molestie, sit amet faucibus ante fermentum. Aenean mollis risus turpis, in viverra orci consectetur in. Praesent et sapien ac nunc lacinia commodo. In auctor fermentum dictum. Aliquam et cursus urna, non dignissim erat. Duis sed porta elit, convallis volutpat nibh."

user1 = User.create!(first_name: "Mert", last_name: "Alpaslan", email: "alpaslanmert@yahoo.com", password: "password", password_confirmation: "password")
user2 = User.create!(first_name: "Ahmet", last_name: "Yılmaz", email: "ahmet@example.com", password: "password", password_confirmation: "password")
user3 = User.create!(first_name: "John", last_name: "Doe", email: "johndoe@example.com", password: "password", password_confirmation: "password")

user1.blog.update!(name: "Mert Alpaslan", background_color: "#ff9494", header_color: "#fffed6", text_color: "#000000", font_family: "arial")
user2.blog.update!(name: "Ahmet Yılmaz", background_color: "#1a5d19", header_color: "#d4eeba", text_color: "#1d6bb4", font_family: "arial")
user3.blog.update!(name: "Johns Blog", background_color: "#870d19", header_color: "#f4f6da", text_color: "#111417", font_family: "times")

3.times do |i|
	user1.posts.create!(title: "Post #{i + 1}", body: body_text)
end

post1 = user2.posts.create!(title: "Test Post Title 1", body: body_text)
post1.comments.create!(body: "Test Comment Body 1", user_id: user3.id)
post1.comments.create!(body: "Test Comment Body 2", user_id: user2.id)
post1.comments.create!(body: "Test Comment Body 3", user_id: user1.id)

post2 = user3.posts.create!(title: "Test Post Title 2", body: body_text)
post2.comments.create!(body: "Test Comment Body 1", user_id: user1.id)
post2.comments.create!(body: "Test Comment Body 2", user_id: user3.id)

