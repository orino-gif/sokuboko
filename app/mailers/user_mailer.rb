class UserMailer < ApplicationMailer
  default from: 'operation@sokuboko.sakura.ne.jp'

  def progress_email(performer)
    @performer = performer
    mail(
        to: "#{@performer.user.email},#{ENV['ADMINISTRATOR_MAIL']}",
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
end
