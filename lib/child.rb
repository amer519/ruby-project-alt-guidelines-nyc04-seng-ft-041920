class Child < ActiveRecord::Base

    has_many :enrollments
    has_many :daycares, through: :enrollments


    def self.create_new_child
        prompt = TTY::Prompt.new
        child_name = prompt.ask("Great! Whats your child's name?")
        Child.create(name: child_name)
    end

    def self.who_is_child
        prompt = TTY::Prompt.new
        child_name = prompt.ask("Welcome Back! Who's your child?")
        found_child = Child.find_by(name: child_name)
        if found_child 
            return found_child
        else
            puts "Sorry, your child is not currently enrolled!"
        end
    end

end