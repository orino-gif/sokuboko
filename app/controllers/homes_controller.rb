class HomesController < ApplicationController
  def index
    @homes = Home.all
  end
  
  def new
    @homes = Home.new
    
    if user_signed_in?
     @sender = User.find(current_user.id)
    end
    @receiver = User.find(params[:status])
  end
  
  def create
    if Home.create(homes_params)
      UserMailer.request(@homes,@sender,@receiver).deliver_later
      p "test"
      redirect_to(performers_path)
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
