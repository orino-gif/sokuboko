class UserMailer < ApplicationMailer
  default from: "#{ENV['ADMINISTRATOR_MAIL']}"

  def progress_email(performer)
    @performer = performer
    mail(
        to: @performer.user.email,
        bcc: ENV['ADMINISTRATOR_MAIL'],
        subject: "[即ボコ女子]#{@performer.user.nickname}さんの書類審査を受け付けました。"
      )
  end
  
  def notification(performer)
    @performer = performer
    mail(
      to: @performer.user.email,
      subject: "[即ボコ女子]#{@performer.user.nickname}さんの入店を許可しました。"
    )
  end
  
  def requests(sender,receiver)
    @sender = sender
    @receiver = receiver
    mail(
      to: "#{ENV['ADMINISTRATOR_MAIL']}",
      bcc: "#{@sender.email},#{@receiver.email}",
      subject: "[即ボコ女子]#{@receiver.nickname}さんへリクエストが送られました。"
    )
  end
end
