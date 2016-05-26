module NotificationsHelper
  def get_time_ago(timestramp)
    time_ago_in_words(timestramp).gsub("aproximadamente","aprox.")
  end

  def link_to_trackable(object, object_type)
    if object
      link_to object_type.downcase, object
    else
      "a #{object_type.downcase} which does not exist anymore"
    end
  end

  def timeago(time, options = {})
    options[:class] ||= "timeago"
    content_tag(:abbr, time.to_s, options.merge(:title => time.getutc.iso8601)) if time
  end

end
