# 5.times do 
#     Article.create({
#         title: Faker::Book.title,
#         body: Faker::Lorem.sentence
#     })
# end

5.times do 
    Author.create({
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        age: Faker::Number.between(from: 10, to: 30)
    })
end