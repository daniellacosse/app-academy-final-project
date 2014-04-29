class UserMailer < ActionMailer::Base

  def authentication_email(user)
    @user = user

    mail(to: user.email, subject: "dArt: Verify your account!")
  end

end
