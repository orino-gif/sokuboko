class PerformersController < ApplicationController
  
  def new
    if user_signed_in?
      @user = User.find(current_user.id)
      @perfomer = Performer.find_by(user_id:@user.id)
    end
  end

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
    p params[:performer][:examination]
    if @performer.update(perfomer_params)
      if "true" != params[:performer][:examination]
        redirect_to request.referer
      else
        redirect_to performers_identification_path
      end
    else
      render :new
    end
  end
  
  private
  #ストロングパラメーター
  def perfomer_params
    params.require(:performer).permit(:image,:nickname,:attack,:age,:three_size,:identification,:full_body)
  end
end
