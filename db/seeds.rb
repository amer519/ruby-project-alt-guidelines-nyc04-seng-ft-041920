Child.destroy_all

40.times do 
    Child.create(
        name: Faker::Name.name,
        age: rand(1..4),
        allergy: Faker::Boolean
    )
end