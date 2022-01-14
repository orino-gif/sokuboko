class UserMailer < ApplicationMailer
  default from: 'xr274375@fc5.so-net.ne.jp'

  def progress_email(performer)
    @performer = performer
    mail(
        to: @performer.user.email,
        subject: "[連絡]#{@performer.nickname}さん。書類審査を受け付けました。"
      )
  end
end
