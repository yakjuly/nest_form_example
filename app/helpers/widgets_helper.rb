module WidgetsHelper
  
  def widget_item(widget)
    content_tag(:li, link_to_function(widget.name, "select_widget({id: #{widget.id}, name: '#{widget.name}'})"), :id => dom_id(widget))
  end
end
