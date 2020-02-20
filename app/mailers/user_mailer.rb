class UserMailer < ApplicationMailer
    default from: "no-reply@kellaapp.com"


    def send_welcome_email(user)
    @user = user
    mail(:to => @user.email, :subject => "Welcome!")
  end
end
