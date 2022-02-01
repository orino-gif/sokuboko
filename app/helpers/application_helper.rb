module ApplicationHelper
  
  #サムネイル画像を表示。登録画像が無い場合は、代替え画像を表示。homes/indexの画像以外はリンク先を付与しない。
  def display_thumbnail(performer)
    if performer.image? 
      if controller.controller_name == "homes"
        link_to image_tag(performer.image.url, class: 'thumbnail sm-center'), "/performers/#{performer.user_id}"
      else
        image_tag(performer.image.url, class: 'thumbnail sm-center')
      end
    else
      if controller.controller_name == "homes"
        link_to image_tag("/img/pending.png", class: 'thumbnail sm-center'), "/performers/#{performer.user_id}"
      else
        image_tag("/img/pending.png", class: 'thumbnail sm-center')
      end
    end 
  end
  
  def schedule(start,finish)
    p start 
    if '00:00' != start && 'NULL' != start 
      p "#{start}～#{finish}"
    else 
      p '休暇' 
    end
  end
end
