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
            puts "Welcome #{child_names}'s parents!!'"
            exit
            
        else
            puts "Sorry, your child is not currently enrolled!"
            

          abort
        end
    end


    def self.update_info
        prompt = TTY::Prompt.new
        
        Child.last.name
        child_update = prompt.ask("Sure let's grab that updated info right away!!")

        child_name = prompt.ask("So what is your child's updated name")
        child_age = prompt.ask("Perfect now just update there current age!", convert: :int)
        child_allergy = prompt.ask("How about the allergies?", convert: :bool)

        Child.last.update(name: child_name, age: child_age, allergy: child_allergy)
        
    end



end