class TestsController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    if "入店" == params[:status]
      @user.performer.progress = '入店'
      @user.performer.save
    end
  end
end
