Child.destroy_all
Daycare.destroy_all

daycares = ["Dunder Daycare", "Sabre Daycare", "Scott's Totts", "Dwight'S Daycare"]


daycares.each do |daycare|
    Daycare.create(
        name: daycare,
        address: Faker::Address.street_address,
        open: "9am Mon - Fri",
        closed: "7pm Mon - Fri"
    )
end




40.times do 
    Child.create(
        name: Faker::Name.name,
        age: rand(1..4),
        allergy: Faker::Boolean,
        enrolled: daycares.sample
    )
end




