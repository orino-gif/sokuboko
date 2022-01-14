class UserMailer < ApplicationMailer
  default from: 'xr274375@fc5.so-net.ne.jp'

  def progress_email(performer)
    @performer = performer
    mail(
        to: "#{@performer.user.email},orino0710@gmail.com",
        subject: "[即ボコ女子]#{@performer.nickname}さんの書類審査を受け付けました。"
      )
  end
end
