class OpinionsController < ApplicationController
  def index
    @opinions = Opinion.all
  end
  
  def new
    @opinions = Opinion.new
  end
  
  def create
    if Opinion.create(opinion_params)
      flash[:success] = '投稿に成功しました。'
      redirect_to(opinions_path(@opinions))
    else
      flash.now[:danger] = '投稿に失敗しました。'
      render :new
    end
  end
  
  private
  
  
  def opinion_params
    params.require(:opinion).permit(:opinion)
  end

end
