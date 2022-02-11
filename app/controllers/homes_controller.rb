class HomesController < ApplicationController
  def index
    @homes = Home.all
  end
  
  def new
    if user_signed_in?
      @sender_id = User.find(current_user.id)
      @performer = Performer.find_by(user_id:@user.id)
    end
    p params[:status]
    @homes = Home.new
  end
  
  def create
    if Home.create(homes_params)
      redirect_to(homes_path(@homes))
    else
      render :new
    end
  end
  
  def show
  end
  
  private
  
  def homes_params
    params.require(:home).permit(:request)
  end
end
