module ApplicationHelper

  def error_messages_for(object)
     render partial: 'shared/error_messages', locals: { object: object }
  end

  def flash_messages
    flash.collect do |key,msg|
      content_tag(:p, msg, id: key, class: 'flash_message')
    end.join.html_safe
  end

end
