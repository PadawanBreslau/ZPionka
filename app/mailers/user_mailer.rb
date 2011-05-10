class UserMailer < ActionMailer::Base
  default :from => "zz.pawn@gmail.com"
  
   def welcome_email(user)
    @user = user
    @url  = "http://zpionka.pl"
    mail(:to => user.email,
         :subject => "You've succesfully registered on www.zpionka.pl")
  end
  
  def send_newsletter(newsletter,user)
    @user = user
    @newsletter = newsletter
    @url  = "http://zpionka.pl"
    mail(:to => @user.email,
         :subject => "Newsletter: " + @newsletter.title )
  end	
  
  
end
