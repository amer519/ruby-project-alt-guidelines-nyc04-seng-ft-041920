Child.destroy_all
Daycare.destroy_all
Enrollment.destroy_all

daycares = ["Dunder Daycare", "Dwight's Daycare", "Scott's Totts"]


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
         )
end






