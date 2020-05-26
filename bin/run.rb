require_relative '../config/environment'



interface = Interface.new()
interface.welcome 
child_instance = interface.enrolling_or_not
interface.child = child_instance
#interface.welcome_user



