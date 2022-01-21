module HomesHelper
  def today_schedule(performer)
    
    case 0#Date.today.wday
    when 0 then
      schedule(performer.sun_start.strftime('%H:%M'),performer.sun_end.strftime('%H:%M'))
    when 1 then
      p "月"
    when 2 then
      p "火"
    else
      #いずれの値に一致しない時に実行されるとき
    end
    
  end
end
