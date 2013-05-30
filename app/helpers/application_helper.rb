module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    if column == sort_column
      icon_class = sort_direction == "ASC" ? "icon-arrow-up" : "icon-arrow-down"
    else
      icon_class = ""
    end
      
    direction = column == sort_column && sort_direction == "ASC" ? "DESC" : "ASC"
    params_new = params.clone
    params_new.delete(:sort)
    params_new.delete(:direction)
    params_new.delete(:action)
    params_new.delete(:controller)
    link_to :sort => column, :direction => direction, :params => params_new do
      "#{title} <i class='#{icon_class}'></i>".html_safe
    end
  end
end