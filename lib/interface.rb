class Interface
    attr_accessor :prompt, :child
    
    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome
        puts "Hello, Welcome to Scott's Totts!"
    end

    def enrolling_or_not
        answer = prompt.select("Would you like to Enroll Your Child in a Daycare?", [
            "Yes",
            "No, My child's Enrolled"
        ])
    
        if answer == "No, My child's Enrolled"
            Child.who_is_child
            #puts "Ok take a look around"
      
        elsif answer == "Yes"
            Child.create_new_child
        end
    end

end