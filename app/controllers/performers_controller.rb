class PerformersController < ApplicationController
  def index
    
  end
  
  private
  #ストロングパラメーター
  def user_params
    params.require(:perfomer).permit(:image )
  end
end
