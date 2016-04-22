class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  
  #def self.check(email="")
	#user = User.find_by_email(email)
	#friend = 
	#firendship = Friendship.friend.find_by_email(email)
	#if user != firendship
	#	return firendship
	#else
	#	return false
	#end
  #end
end
