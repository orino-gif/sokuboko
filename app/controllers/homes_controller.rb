class HomesController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def index
    @homes = Home.all
  end
  
  def new
    @homes = Home.new
    if user_signed_in?
     @sender = User.find(current_user.id)
    end
    @receiver = User.find(params[:status])
    $receiver = User.find(params[:status])
  end
  
  def create
    @sender = User.find(current_user.id)
    @receiver = $receiver

    if Home.create(homes_params)
      @home = Home.last
      p @home
      UserMailer.requests(@sender,@receiver,@home).deliver_later
      p "test"
      redirect_to performers_path , notice: '女の子へリクエストを送信しました。'
    else
      render :new
    end
  end
  
  def show
  end
  
  def update
  end
  
  private
  
  def homes_params
    params.require(:home).permit(:request,:sender_id,:receiver_id,:system_fee,:delivery_time)
  end
end
