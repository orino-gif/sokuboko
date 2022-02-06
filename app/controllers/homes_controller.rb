class HomesController < ApplicationController
  def index
    @homes = Home.all
  end
  
  def new
    @homes = Home.new
  end
  
  def create
    if request.create(request_params)
      flash[:success] = '投稿に成功しました。'
      redirect_to(requests_path(@homes))
    else
      flash.now[:danger] = '投稿に失敗しました。'
      render :new
    end
  end
  
  private
  
  
  def homes_params
    params.require(:request).permit(:request)
  end
end
