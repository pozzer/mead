module ApplicationHelper

  def class_for_callout(tag)
    case tag
    when "notice"
      "success"
    when "success"
      "success"
    when "error"
      "danger"
    else
      "warning"
    end
  end

  def link_to_with_icon(name = [], options = nil, html_options = nil, &block)
    name, icon = name
    name_icon = (content_tag(:i, "", class: icon) + name).html_safe
    link_to(name_icon, options, html_options, &block)
  end

  def get_header_title
    self.controller_name.classify.constantize.model_name.human
  rescue
    self.controller_name.humanize
  end

  def submenu_active?(controller_name)
    return "active" if "#{controller.class.to_s}##{action_name}" == controller_name
    ""
  end

  def get_color_online(user)
    user.online? ? "text-success" : "text-danger"
  end  

  def get_day_week(date)
    if date.to_date == Date.today
      "Hoje"
    elsif date.to_date == Date.yesterday
      "Ontem"
    else
      l date.to_date
    end
        
  end

end
