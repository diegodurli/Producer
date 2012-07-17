module Admin::AdminHelper
  
  def link_to_edit(url, html_options = {})
    html_options.reverse_merge!(class: 'green')
    link_to 'edit', url, html_options
  end
  
  def link_to_destroy(url, html_options = {})
    html_options.reverse_merge!(confirm: 'Are you sure?', method: :delete, class: 'red')
    link_to 'destroy', url, html_options
  end
  
  def section(title='', &block)
    content_tag :div, class: 'section' do
      html = ''
      html = content_tag :h3, title if title.present?
      html = content_tag :div, class: 'in', &block
    end
  end
end