module ApplicationHelper
  def text_for_display(text)
    h(text).gsub("\r\n", '<br>').html_safe
  end
end
