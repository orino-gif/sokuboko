module PerformersHelper
  def make_plan(week,f)
    case week
    when '日曜日' then
      @start = f.time_select :sun_start, include_blank: true, class: 'form-control'
      @end = f.time_select :sun_end ,include_blank: true, class: 'form-control'
    when '火曜日' then
      @start = f.time_select :tue_start, include_blank: true, class: 'form-control'
      @end = f.time_select :tue_end ,include_blank: true, class: 'form-control'
    when '水曜日' then
      @start = f.time_select :wed_start, include_blank: true, class: 'form-control'
      @end = f.time_select :wed_end ,include_blank: true, class: 'form-control'
    when '木曜日' then
      @start = f.time_select :thu_start, include_blank: true, class: 'form-control'
      @end = f.time_select :thu_end ,include_blank: true, class: 'form-control'
    when '金曜日' then
      @start = f.time_select :fri_start, include_blank: true, class: 'form-control'
      @end = f.time_select :fri_end ,include_blank: true, class: 'form-control'
    when '土曜日' then
      @start = f.time_select :sat_start, include_blank: true, class: 'form-control'
      @end = f.time_select :sat_end ,include_blank: true, class: 'form-control'
    end
    
    return @start+'～'+@end
  end
end
