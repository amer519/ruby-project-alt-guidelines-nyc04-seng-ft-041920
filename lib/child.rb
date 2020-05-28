class Child < ActiveRecord::Base

    has_many :enrollments
    has_many :daycares, through: :enrollments


    def self.create_new_child
        system("clear")
        prompt = TTY::Prompt.new
        child_name = prompt.ask("Great! Whats your child's name?".colorize(:color => :white, :background => :cyan))
        sleep(2)
        child_age = prompt.ask("How old is #{child_name} ?".colorize(:color => :white, :background => :cyan), convert: :int)
        sleep(2)
        child_allergy = prompt.ask("Does #{child_name} have any allergies?".colorize(:color => :white, :background => :cyan), convert: :bool)
        sleep(2)

        new_child = Child.create(name: child_name, age: child_age, allergy: child_allergy)
        
        
    end

    
    def self.who_is_child
        prompt = TTY::Prompt.new
        child_names = prompt.ask("Welcome Back! Who's your child?".colorize(:cyan))
        found_child = Child.find_by(name: child_names)
        if found_child 
            puts "Welcome #{child_names}'s parents!!!".colorize(:cyan)
            prompt = TTY::Prompt.new
            another_update = prompt.ask("Would you like to update #{child_names}'s info?".colorize(:cyan), convert: :bool)
            if another_update == true
                self.update_info
                puts "******************************".colorize(:cyan)
                puts "#{child_names} has been updated!!!"
                puts "******************************".colorize(:cyan)
            else another_update == false
                puts "***********************".colorize(:cyan)
                puts "Ok, have a great day!!"
                puts "***********************".colorize(:cyan)
                
            end

            
            exit
            
        else
            puts "*******************************************"
            puts "Sorry, your child is not currently enrolled!".colorize(:cyan)
            puts "*******************************************"
            prompt = TTY::Prompt.new
            yes_or_no = prompt.ask("Would you like to enroll your child now?".colorize(:cyan), convert: :bool)
            if yes_or_no == true
                self.create_new_child
            else yes_or_no == false
                puts "Ok have a Dunder day".colorize(:cyan)
            end
            
          #abort
        end
        
        
    end

    def self.delete_enrollment
        prompt = TTY::Prompt.new
        
        
        the_name = prompt.ask("What's your childs name".colorize(:cyan))
        Child.find_by(name: the_name)
        child_delete = prompt.ask("Are you sure you want to take your child out of daycare?".colorize(:cyan), convert: :bool)
        if child_delete == true
            Enrollment.last.delete
            puts "We're sad to see you go, come back anytime".colorize(:cyan)
            exit
        elsif child_delete == false
            puts "Ok, We're happy your still part of out community!!!".colorize(:cyan)
        exit
        end

    end


    def self.update_info
        system("clear")
        prompt = TTY::Prompt.new
        
        Child.last.name
        child_update = prompt.ask("Sure let's grab that updated info right away!!".colorize(:cyan))

        child_name = prompt.ask("So what is your child's updated name".colorize(:cyan))
        child_age = prompt.ask("Perfect now just update there current age!".colorize(:cyan), convert: :int)
        child_allergy = prompt.ask("How about the allergies?".colorize(:cyan), convert: :bool)

        Child.last.update(name: child_name, age: child_age, allergy: child_allergy)
                puts "******************************".colorize(:cyan)
                puts "Your child's info has been updated!!!"
                puts "******************************".colorize(:cyan)
        
        
    end

    # def return_to_menu
        



end