class UserMailer < ApplicationMailer
  def send_mail(user,message)
    @user=user
    @message=message
    mail to: user.email
  end
end
