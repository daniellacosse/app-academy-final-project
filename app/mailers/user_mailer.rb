class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def authentication_email(user)
    @user = user
    
    mail(to: user.email, subject: "verify dArt account")
  end
  
end
