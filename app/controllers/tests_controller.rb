class TestsController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @performer = Performer.find_by(user_id:@user.id)
    if '入店' == params[:status]
      @user.performer.progress = '入店'
      @user.performer.save
      UserMailer.notification(@performer).deliver_later
    elsif '退店' == params[:status]
      @user.performer.progress = '退店'
      @user.performer.save
      
    end
  end
end
