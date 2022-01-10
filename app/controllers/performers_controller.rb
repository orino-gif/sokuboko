class PerformersController < ApplicationController

  def show
    if user_signed_in?
      @user = User.find(current_user.id)
      @perfomer = Performer.find_by(user_id:@user.id)
    end
  end
  
  def edit
    if user_signed_in?
      @user = User.find(current_user.id)
      @perfomer = Performer.find_by(user_id:@user.id)
    end
  end
  
  def update
    @performer = Performer.find_by(user_id:current_user.id)
    if @performer.update(perfomer_params)
      redirect_to request.referer
    else
      render :new
    end
  end
  
  private
  #ストロングパラメーター
  def perfomer_params
    params.require(:performer).permit(:image)
  end
end
