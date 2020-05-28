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
        puts "******************************************************".colorize(:cyan)
        something = prompt.select("Hi, Would you like to Enroll Your Child to a Daycare?") do |menu|
        puts "******************************************************".colorize(:magenta)
            menu.choice "Yes, I'd Love To!!".colorize(:cyan), -> { Child.create_new_child } 

            menu.choice "No, My child's Enrolled".colorize(:magenta), -> { Child.who_is_child }

            menu.choice "Take my child out of Daycare".colorize(:cyan), -> { Child.delete_enrollment}

            menu.choice "Exit".colorize(:magenta), -> { exit }
        end
        
        @user = something
        
    end

    def choose_daycare
        system("clear")
            puts "**********************************************************".colorize(:cyan)
            puts "We're excited for you child to be part of our community!!"
            puts "**********************************************************".colorize(:cyan)
            daycare_names = Daycare.all.map do |daycare_instance|
                daycare_instance.name
                
        end
        
       list_of_daycare = prompt.select("Great!!! Which Daycare you would like to enroll your child in".colorize(:cyan), daycare_names)
        first = Daycare.find_by(name: list_of_daycare)
        
         Enrollment.create(child_id: @user.id, daycare_id: first.id)
    end  


    def update_child
        prompt.select("Great!! Your child is now enrolled! Would you like to update your childs info?".colorize(:cyan)) do |menu|
            menu.choice "Yes Please", -> { Child.update_info }
            
            menu.choice "No, Thank you", -> { puts "OK, your all set than".colorize(:magenta) }
            sleep(2)
            
            
        end
        enrolling_or_not
    end

    #  def logo
    #     puts 
    #  end
    # welcome_logo = 7MMF'     A     `7MF'     \/                                                db   mm                `7MM        .d' ""                                                           `7MM         db `7MM      `7MM        mm                *MM                                                   mm                 .d' ""                                                                                                             db   mm             OO       
    # # '    `MA     ,MA     ,V       `'                                                     MM                  MM        dM`                                                                MM              MM        MM        MM                 MM                                                   MM                 dM`                                                                                                                     MM             88  __,  
    # # '     VM:   ,VVM:   ,V .gP"Ya   `7Mb,od8 .gP"Ya       .gP"Ya `7M'   `MF,p6"bo `7MM mmMMmm .gP"Ya    ,M""bMM       mMMmm,pW"Wq.`7Mb,od8     `7M'   `MF',pW"Wq.`7MM  `7MM       ,p6"bo  MMpMMMb. `7MM   MM   ,M""bMM      mmMMmm ,pW"Wq.       MM,dMMb.   .gP"Ya      `7MMpdMAo.  ,6"Yb. `7Mb,od8 mmMMmm      ,pW"Wq. mMMmm       ,pW"Wq.`7MM  `7MM `7Mb,od8      ,p6"bo   ,pW"Wq.`7MMpMMMb.pMMMb. `7MMpMMMb.pMMMb`7MM  `7MM `7MMpMMMb. `7MM mmMMmm `7M'   `MF|| `7MM  
    # # '      MM.  M' MM.  M',M'   Yb    MM' "',M'   Yb     ,M'   Yb  `VA ,V'6M'  OO   MM   MM  ,M'   Yb ,AP    MM        MM 6W'   `Wb MM' "'       VA   ,V 6W'   `Wb MM    MM      6M'  OO  MM    MM   MM   MM ,AP    MM        MM  6W'   `Wb      MM    `Mb ,M'   Yb       MM   `Wb 8)   MM   MM' "'   MM       6W'   `Wb MM        6W'   `Wb MM    MM   MM' "'     6M'  OO  6W'   `Wb MM    MM    MM   MM    MM    MM MM    MM   MM    MM   MM   MM     VA   ,V ||   MM  
    # # '      `MM A'  `MM A' 8M""""""    MM    8M""""""     8M""""""    XMX  8M        MM   MM  8M"""""" 8MI    MM        MM 8M     M8 MM            VA ,V  8M     M8 MM    MM      8M       MM    MM   MM   MM 8MI    MM        MM  8M     M8      MM     M8 8M""""""       MM    M8  ,pm9MM   MM       MM       8M     M8 MM        8M     M8 MM    MM   MM         8M       8M     M8 MM    MM    MM   MM    MM    MM MM    MM   MM    MM   MM   MM      VA ,V  `'   MM  
    # # '       :MM;    :MM;  YM.    ,    MM    YM.    ,     YM.    ,  ,V' VA.YM.    ,  MM   MM  YM.    , `Mb    MM        MM YA.   ,A9 MM             VVV   YA.   ,A9 MM    MM      YM.    , MM    MM   MM   MM `Mb    MM        MM  YA.   ,A9      MM.   ,M9 YM.    ,       MM   ,AP 8M   MM   MM       MM       YA.   ,A9 MM        YA.   ,A9 MM    MM   MM         YM.    , YA.   ,A9 MM    MM    MM   MM    MM    MM MM    MM   MM    MM   MM   MM       VVV   ,,   MM  
    # # '        VF      VF    `Mbmmd'  .JMML.   `Mbmmd'      `Mbmmd'.AM.   .MAYMbmd' .JMML. `Mbmo`Mbmmd'  `Wbmd"MML.    .JMML.`Ybmd9'.JMML.           ,V     `Ybmd9'  `Mbod"YML.     YMbmd'.JMML  JMML.JMML.JMML.`Wbmd"MML.      `Mbmo`Ybmd9'       P^YbmdP'   `Mbmmd'       MMbmmd'  `Moo9^Yo.JMML.     `Mbmo     `Ybmd9'.JMML.       `Ybmd9'  `Mbod"YML.JMML.        YMbmd'   `Ybmd9'.JMML  JMML  JMML.JMML  JMML  JMML`Mbod"YML.JMML  JMML.JMML. `Mbmo    ,V    db .JMML.
    # # '                                                                                                                                             ,V                                                                                                                      MM                                                                                                                                                                             ,V              
    # # '                                                                                                                                          OOb"                                                                                                                     .JMML.                                                                                                                                                                        OOb"               
    

   
   

end

    





   




