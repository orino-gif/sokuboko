class PerformersController < ApplicationController
  
  def index
    @performers = Performer.all
  end
  def new
    if user_signed_in?
      @user = User.find(current_user.id)
      @performer = Performer.find_by(user_id:@user.id)
    end
  end

  def show
    @user = User.find(params[:id])
    @performer = Performer.find_by(user_id:@user.id)
    if '審査依頼' == params[:status]
      @performer.progress = '審査中'
      @performer.save
      UserMailer.progress_email(@performer).deliver_later
    end

    if nil != params[:request]
      @sender = User.find(current_user.id)
      @receiver = User.find(params[:request])
      @home = Home.last
      
      UserMailer.request_content(@sender,@receiver,@home).deliver_later
      redirect_to controller: :performers, action: :show
      flash[:request] = "通知:リクエストのメールを送信しました。"
      
    end
  end
  
  def edit
    if user_signed_in?
      @certification = User.find(current_user.id)
    end
    @user = User.find(params[:id])
    
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
    @certification = User.find(current_user.id)
    if ENV['ADMINISTRATOR_MAIL'] == @certification.email
      @performer = Performer.find(params[:id])
    else
      @performer = Performer.find_by(user_id:current_user.id)
    end
    
    p params[:performer][:examination]
    if @performer.update(perfomer_params)
      if "identification" == params[:performer][:examination]
        redirect_to performers_identification_path
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
    params.require(:performer).permit(:image,:attack,:age,:three_size,:identification,:full_body,:progress,
     :sun_start,:sun_end,:tue_start,:tue_end,:wed_start,:wed_end,:thu_start,:thu_end,:fri_start,:fri_end,:sat_start,:sat_end)
  end
  
  
end
