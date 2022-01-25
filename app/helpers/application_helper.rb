module ApplicationHelper
  def schedule(start,finish)
    p start 
    if '00:00' != start && 'NULL' != start 
      p "本日 #{start}～#{finish}"
    else 
      p '休暇' 
    end
  end
end
