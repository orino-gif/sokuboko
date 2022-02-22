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
    
    p params[:key]
    if params[:status]
      @receiver = User.find(params[:status])
      $receiver = User.find(params[:status])
    else
      @receiver = User.find(params[:key])
      $receiver = User.find(params[:key])
    end
      
  end
  
  def confirm
    @home = Home.last
    @sender = Performer.find(@home.sender_id)
    @receiver = Performer.find(@home.receiver_id)
  end
  
  
  
  def create
    @sender = User.find(current_user.id)
    @receiver = $receiver

    if Home.create(homes_params)
      @home = Home.last
      
      p @home
      UserMailer.requests(@sender,@receiver,@home).deliver_later
      p "test"
      redirect_to homes_confirm_path #, notice: '女の子へリクエストを送信しました。'
    else
      render :new
    end
  end
  
  def show
   @homes = Home.where(sender_id:current_user.id).or(Home.where(receiver_id:current_user.id))
    if nil != params[:request]
      @sender = User.find(current_user.id)
      @receiver = User.find(params[:request])
      @home = Home.find(params[:home_id])
      
      p "home"+@home.request

      UserMailer.request_content(@sender,@receiver,@home).deliver_later
      redirect_to home_path, notice: '手配中です・・・。'
    end
  end
  
  def update
  end
  
  def destroy
    # Home.last.destroy
    # render :new
    
  end
  
  private
  
  def homes_params
    params.require(:home).permit(:request,:sender_id,:receiver_id,:system_fee,:delivery_time)
  end
end
