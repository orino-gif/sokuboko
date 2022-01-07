class PerformersController < ApplicationController

  def show
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end
  
  def edit
    
  end
  
  private
  #ストロングパラメーター
  def user_params
    params.require(:perfomer).permit(:image)
  end
end
