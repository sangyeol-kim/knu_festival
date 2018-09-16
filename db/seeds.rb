# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 어드민 계정
User.create(:email => "admin@likelion.org", :password => "123456", :password_confirmation => "123456")

# 푸드트럭 게시판 글 작성
16.times do |x|
    Food.create(title: "푸드트럭-#{x}", iconid: (1..5).to_a.sample, ps:"매진임박#{x}")
end

# 방문자 수 체크 init
Home.create(:count_view => "0")