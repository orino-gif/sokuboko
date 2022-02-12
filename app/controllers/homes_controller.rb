class HomesController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def index
    @homes = Home.all
  end
  
  def new
    @homes = Home.new
    
    if user_signed_in?
     @sender = User.find(current_user.id)
     $sender = @sender
    end
    @receiver = User.find(params[:status])
    $receiver = @receiver
  end
  
  def create
    @sender = User.find(current_user.id)
    if Home.create(homes_params)
      UserMailer.requests(@sender).deliver_later
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
    params.require(:home).permit(:request,:sender_id,:receiver_id)
  end
end
