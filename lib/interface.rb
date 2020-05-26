class Interface
    attr_accessor :prompt, :child
    
    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome
        puts "Hello, Welcome to Scott's Totts!"
    end

    def enrolling_or_not
        answer = prompt.select("Great Choice!!! Would you like to Enroll Your Child in this Daycare?", [
            "Yes, I'd Love To!!",
            "No, My child's Enrolled"
        ])
    
        if answer == "No, My child's Enrolled"
            Child.who_is_child
            
      
        elsif answer == "Yes, I'd Love To!!"
            Child.create_new_child
        end
    end

    def choose_daycare
        puts "We're excited for you child to be part of our community!!"
        daycare_names = Daycare.all.map do |daycare_instance|
            daycare_instance.name
        end
        list_of_daycare = prompt.select("Lets start off by choosing the Daycare you would like to enroll your child in", daycare_names)
         
         first = "Dunder Daycare"
         second = "Dwight's Daycare"
         third = "Scott's Totts"
         
         if list_of_daycare == first
            Child.create(enrolled: first)
         elsif 
            list_of_daycare == second
            Child.create(enrolled: second)
         else
            list_of_daycare == third
            Child.create(enrolled: third) 
          end
    end



    



    

    # def welcome_user
    #     puts "We're excited for #{child.name} to be part of our community"
    #     #prompt.ask("How old is #{child.name} ?", convert: :integer)
    # end

end