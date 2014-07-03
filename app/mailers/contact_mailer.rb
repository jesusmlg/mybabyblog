class ContactMailer < ActionMailer::Base
  default from: "inteclu@gmail.com"

  	def contact_mailer(name,msg)
  		@name = name
  		@msg = msg
  		mail to: "inteclu@gmail.com", subject: "Mensaje desde mybaby"
	end
end
