class PerformersController < ApplicationController
  
  def new
    if user_signed_in?
      @user = User.find(current_user.id)
      @performer = Performer.find_by(user_id:@user.id)
    end
  end

  def show
    if user_signed_in?
      @user = User.find(current_user.id)
      @performer = Performer.find_by(user_id:@user.id)
      if "審査依頼" == params[:status]
        @performer.progress = '審査中'
        @performer.save
        UserMailer.progress_email(@performer).deliver_later
      end
    else
      @user = User.find(params[:id])
    end
  end
  
  def edit
    if user_signed_in?
      @user = User.find(current_user.id)
      @title = "default form value"
      #@performer = Performer.find_by(user_id:@user.id)
    end
  end
  
  def identification
    @user = User.find(current_user.id)
    @performer = Performer.find_by(user_id:@user.id)
  end
  
  def full_body
    @user = User.find(current_user.id)
    @performer = Performer.find_by(user_id:@user.id)
  end
  
  def update
    @performer = Performer.find_by(user_id:current_user.id)
    p params[:performer][:examination]
    if @performer.update(perfomer_params)
      if "identification" == params[:performer][:examination]
        redirect_to performers_identification_path
        
      elsif "full_body" == params[:performer][:examination]
        redirect_to request.referer
      else
        redirect_to request.referer
      end
    else
      render :new
    end
  end
  
  private
  #ストロングパラメーター
  def perfomer_params
    params.require(:performer).permit(:image,:nickname,:attack,:age,:three_size,:identification,:full_body,:progress,
     :sun_start,:sun_end,:tue_start,:tue_end,:wed_start,:wed_end,:thu_start,:thu_end,:fri_start,:fri_end,:sat_start,:sat_end)
  end
end
