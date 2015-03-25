module CommentsHelper
  def write_by(comment)
    line = '"'+ comment.comment_short + '" ... por ' + content_tag(:i,comment.nick)
    line.html_safe
  end
end
