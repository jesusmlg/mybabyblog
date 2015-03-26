module ApplicationHelper
  SECRET_WORD="hugolm"

  def glyphicon(icon)
    "<span class='#{icon}' aria-hidden='true'></span>".html_safe
  end
end
