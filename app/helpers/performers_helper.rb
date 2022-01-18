module PerformersHelper
  def schedule(start,finish)
    p start 
    if '00:00' != start && 'NULL' != start 
      p "#{start}～#{finish}"
    else 
      p '休暇' 
    end
  end
end
