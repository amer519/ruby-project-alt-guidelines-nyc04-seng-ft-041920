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
        
        something = prompt.select("Hi, Would you like to Enroll Your Child to a Daycare?") do |menu|
        
            menu.choice "Yes, I'd Love To!!".colorize(:cyan), -> { Child.create_new_child } 

            menu.choice "No, My child's Enrolled".colorize(:magenta), -> { Child.who_is_child }

            menu.choice "Take my child out of Daycare".colorize(:cyan), -> { Child.delete_enrollment}

            menu.choice "Exit".colorize(:magenta), -> { exit }
            logo
            puts "******************************************************".colorize(:cyan)
            puts "******************************************************".colorize(:magenta)

        end
        
        @user = something
        
    end
     
        
    def choose_daycare
        system("clear")
            puts "**********************************************************".colorize(:cyan)
            puts "We're excited for your child to be part of our community!!"
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
            
           one = menu.choice "Yes Please", -> { Child.update_info }
            
           two = menu.choice "No, Thank you", -> { puts "OK, your all set than".colorize(:magenta) }
            sleep(2)
            
            if two == "OK, your all set than"
                sleep(2)
                enrolling_or_not
            
            end
        end
        enrolling_or_not
    end

    def logo
        puts "           `/+o/.
                     .+sso+/:oydyo/:-:+shdys/    `-:.     `-/+o+/`
               `/sdh+/::/::ss:`ymdhyso//hmMNyhNNms+ososys+/-:/shms/`
             .+hNNy++oo+/.`.--/osyhdmNNMMMMMMMMMNdsssssoso+hhhhsoo+ymdo.
           -smNy/+ymmmmmNNNNMNMMMMMNNNmmNMMMMMMMMMho:///:--shydNMMNdo-sNs`
          -hNd+-sNMNdmNMMMNNNMNNNMMMddNMMNNmNMMMMMMNmy+///::/:-:/++ymNNdmMN:
          `sNMs`+NMNNNMMMMNNNMMMMMMNmhyso///+ohMmoNMmoo+/::/-:oymNNmsosshdhmMM/
        +NMMy`hMMMhyNMNMMNNNMds:-.`-:syddmNMMmyo`+yMMho:..-+//++omMNNNNNNNmdNMs
       :mMMMh`yMNdodNNNMNMMMs.+sdmmmmmdhNMMMNhy/..`-syhNmdyssso+/.`:yNMMMMNMNMMMy
      :NMNh:-+MMh+mdNNNNNMd.+NNMMMMMMMMmho:-......:--::ohNMMMMMMNmNy/.oNMNmNMNMMMs
     :NMm+/dmmMNydyhNdhMMN.yMMNmhysso+:-``        ```.--:/+sdMMMMMNNNm:-mMNNNNMMMMy
    :NMy/hNMMMMmNddsh/NmMy-Mms:..`.--.`                ``..-.:yNMMMMNMNs:NMMMNNNNMMy
   :NNy/mMMMMMMmNMMshsNdMo/d-...``                       ```...-yMMMNNMd`NMMNMdmoNMM-
  /mMm+NMNNMMNMNNNNNNNNMMmom/                              ```..`+NMMMMh`NMMMMNNdhNMh
 +NMMmmMNyNMNMMMMMNmmmNMdNNyh+.                             ``````/NMMM::MMMMNMNNmNMN
+MNNMMMNymMNNMMMNNNNNMh+:+dNmddhyoo+`                        ````.`sMMN`sMNNMNNMNNNNN
dNNNMNNddMNNNNNNmymMN+---::/shdhyyy:                         `````..hMo.NMNMNMMMNmMMd
dNNNMMNmNNNmmNMNdNMM+.-..----.-:::.                          ````...:mh/NMMMNMMMNNMMh
sMNNMMNMNNmyNMNdmNMo--.....                                  ``...---:dNMNMMNMMNNNMMN.
 :NNNMMMNNNsmMNmMNMy...`.-.`                                    `.-----:odNmmNMMMMMNMMo
 .NMMMmMMMNmMNNNNMm:-.```..                                       ``-----:/o//dMMMNMMMm
 .NMMMNMMNMMNMNNNNs--.``...                                         `....---..dMNMMMMM`
 .NNMMNNNNNMMMNNNN:-...`...                                          ```.....`+MMMMMMM.
 .MNNNNNNNMMMMMNNy.......-.`                                         ``..---.`.NMMMMMM`
 `NMNMMNNNMMNMMMm-...`.-----.`                                        ``.-----.`yMMMMMd
 dMMMNNNNMMNNMMo`-....----..`          ``                      `.`` ```.------`:MMMMM-
 /MMNMNNNMMNMMN-`.`..-.--.` `--..-:-.-.``..``               ```.-......--.----..NMMMd
 `mMNMNNMMMNNMN.``...-.-../hddyysyhysyyso+--/::-..--...----:::+syyyyhhdddy+:-.-.hMMM:
  :NNNNNNMMMMMN.`....--.:dy/:-.-/+++ososss+/:+shyo/::/:+os+:+syosyoso+/://ss//.`+MMm
   +MdmNNMNMMMN+.--....:+-.-:+ooymdddmdhyo++ss+/yMo.`..oNsyhdhmdmmmmNmdo:-.--:+-:MM/
  `y/..-+dNNMMMo-shhyo++--+sso-`dsymoso.smyso+//.od+/:/ho+yyhd/ymsNhyy./yy/``.-hhmm`
  .s+md+- oMMMm``.-/sy//-.+/s.  odys+s-  /shyso+.sm+:::yd/hh+:`.hyyhy- `/y/.` `hs/s`
  -oyMNyhs:NMMo     `.-`         .---` ``.`/::+s/ms````-mo+:`````.--` ````     `sNm`
  `hsMh`.hymMM:       `-         `          .:+:hy`     od:-`                  .+sM-``
   o+o/``-/mMM-        .-                ``.```hy`       s.`.`                 -/+M+``
   .s `./NMMMM-         --            ````  `:ho`        .s`  ```             ./.+My`
    /: `+MMdMM/          -.  `       `   ..+++-           :d/.             ``:o-`oMy
     o. .sdNMMm`            `--:://+//.`-///:.           `.ohooo:-.`` `.-:+//:..`hMy
     `s```.yMMMs                  ```     .y+  `::.:----.-``o:-::/:::--:::-----..mMo
     :s` `oMNMN-                         :N+  -NNhy/:/sds./:..----------------`/MN
     +o``-NMNMd`                      `-syyoo++/.++:so/+yN+..--....-..-....--`dM+
     +:.`oMNNN`                     .:-` `.::.` `--..---/+/---.```........-.:d:
      ./++Ny::`                   `--`          .--..-----::-..```......---.s.
        `:os.--`                  .`            `.. ``.------.`.```..-----.:o
          `h-..`                 ``        .:syy/-/ydho-.--...`````.------.+.
           +o`.`                        ./ymNNNNNNNmmNNNh:....``.```.-----:s
            `h-`.                    -/+oyo/:----:---.--:+sso:........--::-+:
             /d...                 `.++:  -:--/+:/oo+o++-.``--.....-----:-:y
             `Md:.`                ``     `-:/+ooooo+/-........-----------yo
              mNNs-`                     `..-/oo+://:/oo:......----------os
              h:+md:.                  ...``.`         `------.---------++
             `h..-+ddo.`                            ``.----------------s:
              h` .--/ydy:`                   `...--------------------+y.
              h`   ..--+yds+.`               `....----------------:+dN`
             `y      `.-.-:sdhs:.`    `...````..----------------:smsdm
             `h         .--..-+ymdy+/:----:----------------.-/shs+.`os
             `h           `..--..:sdmmhyo/::----------::/+syhy/....`+-
             -y              `..--..--/oosyyyhhhyyyssoooo/:.`...`.` /-
            `.                  `..--.......................````   +`
                                 `...------..-.........``
                                  ``..-.--........``
                                       ```..```


".colorize(:cyan)

    end
                                       
                                    

   
   

end

    





   




