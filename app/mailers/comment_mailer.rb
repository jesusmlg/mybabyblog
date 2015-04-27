class CommentMailer < ActionMailer::Base
  default from:  ENV['MYBABYBLOG_EMAIL'] 

    def comment_mailer(art,msg,name)
      @art = art
      @msg = msg
      @name = name
      mail to: ENV['MYBABYBLOG_EMAIL_DEST'] , subject: "Nuevo comentario en un artículo de la web"
  end
end
