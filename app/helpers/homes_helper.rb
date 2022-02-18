module HomesHelper
  def today_schedule(performer)
    
    case Date.today.wday
    when 0 then
      schedule(performer.sun_start.strftime('%H:%M'),performer.sun_end.strftime('%H:%M'))
    when 1 then
      p "定休日"
    when 2 then
      schedule(performer.tue_start.strftime('%H:%M'),performer.tue_end.strftime('%H:%M'))
    when 3 then
      schedule(performer.wed_start.strftime('%H:%M'),performer.wed_end.strftime('%H:%M'))
    when 4 then
      schedule(performer.thu_start.strftime('%H:%M'),performer.thu_end.strftime('%H:%M'))
    when 5 then
      schedule(performer.fri_start.strftime('%H:%M'),performer.fri_end.strftime('%H:%M'))
    when 6 then
      schedule(performer.sat_start.strftime('%H:%M'),performer.sat_end.strftime('%H:%M'))

    else
      #いずれの値に一致しない時に実行されるとき
    end
    
  end
  
  def calculation_running_time(sender, receiver)
    if sender.user.address.include?("松戸") && receiver.user.address.include?("松戸") or
      sender.user.address.include?("市川") && receiver.user.address.include?("市川") or 
      sender.user.address.include?("葛飾") && receiver.user.address.include?("葛飾") or 
      sender.user.address.include?("葛飾") && receiver.user.address.include?("松戸") or 
      sender.user.address.include?("市川") && receiver.user.address.include?("松戸") then
      
      return 30
      
    elsif sender.user.address.include?("松戸") && receiver.user.address.include?("市川") or 
      sender.user.address.include?("松戸") && receiver.user.address.include?("葛飾") then 

      return 40
      
    elsif sender.user.address.include?("市川") && receiver.user.address.include?("葛飾") or 
      sender.user.address.include?("葛飾") && receiver.user.address.include?("市川") then
      
      return 50
      
    else
      return "計算不可能"
    end
  end
end
