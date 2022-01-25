module HomesHelper
  def today_schedule(performer)
    
    case Date.today.wday
    when 0 then
      schedule(performer.sun_start.strftime('%H:%M'),performer.sun_end.strftime('%H:%M'))
    when 1 then
      p "本日 定休日"
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
end
