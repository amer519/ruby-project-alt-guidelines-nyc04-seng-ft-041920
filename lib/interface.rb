class Interface
    attr_accessor :prompt, :child, :user
    
    def initialize
        @prompt = TTY::Prompt.new
        @user = nil
    end

    def welcome
        system("clear")
        puts "        ██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗    ████████╗ ██████╗ 
        ██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝    ╚══██╔══╝██╔═══██╗
        ██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗         ██║   ██║   ██║
        ██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝         ██║   ██║   ██║
        ╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗       ██║   ╚██████╔╝
         ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝       ╚═╝    ╚═════╝ 
                                                                                            "
        puts "              ███████╗ ██████╗ ██████╗ ████████╗████████╗███████╗    ████████╗ ██████╗ ████████╗████████╗███████╗
              ██╔════╝██╔════╝██╔═══██╗╚══██╔══╝╚══██╔══╝██╔════╝    ╚══██╔══╝██╔═══██╗╚══██╔══╝╚══██╔══╝██╔════╝
              ███████╗██║     ██║   ██║   ██║      ██║   ███████╗       ██║   ██║   ██║   ██║      ██║   ███████╗
              ╚════██║██║     ██║   ██║   ██║      ██║   ╚════██║       ██║   ██║   ██║   ██║      ██║   ╚════██║
              ███████║╚██████╗╚██████╔╝   ██║      ██║   ███████║       ██║   ╚██████╔╝   ██║      ██║   ███████║
              ╚══════╝ ╚═════╝ ╚═════╝    ╚═╝      ╚═╝   ╚══════╝       ╚═╝    ╚═════╝    ╚═╝      ╚═╝   ╚══════╝
                                                                                                           ".colorize(:cyan)
        sleep(4)

        
    end


    

    def enrolling_or_not
        
        something = prompt.select("Would you like to Enroll Your Child to a Daycare?") do |menu|
            menu.choice "Yes, I'd Love To!!", -> { Child.create_new_child } 

            menu.choice "No, My child's Enrolled", -> { Child.who_is_child }

            menu.choice "Take my child out of Daycare", -> { Child.delete_enrollment}
        end
        @user = something
        
    end

    def choose_daycare
        system("clear")
            puts "We're excited for you child to be part of our community!!"
            daycare_names = Daycare.all.map do |daycare_instance|
                daycare_instance.name
        end
       list_of_daycare = prompt.select("Great!!! Which Daycare you would like to enroll your child in", daycare_names)
        first = Daycare.find_by(name: list_of_daycare)
        
         Enrollment.create(child_id: @user.id, daycare_id: first.id)
    end  


    def update_child
        prompt.select("Great!! Your child is now enrolled! Would you like to update your childs info?") do |menu|
            menu.choice "Yes Please", -> { Child.update_info }
            
            menu.choice "No, Thank you", -> { puts "OK, your all set than" }
        end
    end

    #  def logo
    #     puts 
    #  end
    
    

   
   

end

    





   




# def enrolling_or_not
    #     answer = prompt.select("Great Choice!!! Would you like to Enroll Your Child in this Daycare?", [
    #         "Yes, I'd Love To!!",
    #         "No, My child's Enrolled"
    #     ])
    
    #     if answer == "No, My child's Enrolled"
    #         Child.who_is_child
            
      
    #     elsif answer == "Yes, I'd Love To!!"
    #         Child.create_new_child
    #     end
    # end







# def welcome_user
    #     puts "We're excited for #{child.name} to be part of our community"
    #     #prompt.ask("How old is #{child.name} ?", convert: :integer)
    # end