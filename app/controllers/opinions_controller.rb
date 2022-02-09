class OpinionsController < ApplicationController
  def index
    @opinions = Opinion.all
  end
  
  def show
    @opinions = Opinion.new
  end
  
  def create
    if Opinion.create(opinion_params)
      redirect_to requests_url, notice: '投稿しました。'
    else
      render :new
    end
  end
  
  private
  
  
  def opinion_params
    params.require(:opinion).permit(:opinion)
  end

end
