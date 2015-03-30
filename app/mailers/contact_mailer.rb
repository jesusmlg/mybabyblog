class ContactMailer < ActionMailer::Base
  default from:  ENV['MYBABYBLOG_EMAIL'] 

  	def contact_mailer(name,msg)
  		@name = name
  		@msg = msg
  		mail to: ENV['MYBABYBLOG_EMAIL_DEST'] , subject: "Mensaje desde Aventuras de Primeriza"
	end
end
