class Child < ActiveRecord::Base

    has_many :enrollments
    has_many :daycares, through: :enrollments


    def self.create_new_child
        system("clear")
        prompt = TTY::Prompt.new
        child_name = prompt.ask("Great! Whats your child's name?")
        sleep(2)
        child_age = prompt.ask("How old is #{child_name} ?", convert: :int)
        sleep(2)
        child_allergy = prompt.ask("Does #{child_name} have any allergies?", convert: :bool)
        sleep(2)

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

    def self.delete_enrollment
        prompt = TTY::Prompt.new
        
        
        the_name = prompt.ask("What's your childs name")
        Child.find_by(name: the_name)
        child_delete = prompt.ask("Are you sure you want to take your child out of daycare?", convert: :bool)
        if child_delete == true
            Enrollment.last.delete
            puts "We're sad to see you go, come back anytime"
            exit
        elsif child_delete == false
            puts "Ok, We're happy your still part of out community"
        exit
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