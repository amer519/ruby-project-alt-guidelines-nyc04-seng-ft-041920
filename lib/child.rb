class Child < ActiveRecord::Base

    has_many :enrollments
    has_many :daycares, through: :enrollments


    def self.create_new_child
        prompt = TTY::Prompt.new
        child_name = prompt.ask("Great! Whats your child's name?")
        child_age = prompt.ask("How old is #{child_name} ?", convert: :int)
        child_allergy = prompt.ask("Does #{child_name} have any allergies?", convert: :bool)

        new_child = Child.create(name: child_name, age: child_age, allergy: child_allergy)
        
        
    end

    
    def self.who_is_child
        prompt = TTY::Prompt.new
        child_names = prompt.ask("Welcome Back! Who's your child?")
        found_child = Child.find_by(name: child_names)
        if found_child 
            return found_child
        else
            puts "Sorry, your child is not currently enrolled!"
            prompt.ask("Would you like to enroll?")


        end
    end



end