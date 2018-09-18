# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 어드민 계정
User.create(:email => "admin@likelion.org", :password => "123456", :password_confirmation => "123456", fdid: 0)
# 푸드트럭 계정
16.times do |x|
    User.create(email: "60truck#{x+1}@kangwon.ac.kr", password: "#{((x+1)*404567)}", password_confirmation: "#{((x+1)*404567)}", fdid: (x+1), areaid: 1)
end

# 푸드트럭 게시판 글 작성
# 5.times do |x|
#     Food.create(title: "푸드트럭-#{x}", ps:"매진임박#{x}", number:1)
#     Food.create(title: "푸드트럭-#{x}", ps:"매진임박#{x}", number:2)
#     Food.create(title: "푸드트럭-#{x}", ps:"매진임박#{x}", number:3)
# end

# 방문자 수 체크 init
Home.create(:count_view => "404")