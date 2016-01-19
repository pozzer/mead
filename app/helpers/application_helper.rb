module ApplicationHelper

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

end
