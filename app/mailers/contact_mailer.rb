class ContactMailer < ActionMailer::Base
  default from:  ENV['MYBABYBLOG_EMAIL'] 

  	def contact_mailer(name,msg)
  		@name = name
  		@msg = msg
  		mail to: ENV['MYBABYBLOG_EMAIL'] , subject: "Mensaje desde mybaby"
	end
end
