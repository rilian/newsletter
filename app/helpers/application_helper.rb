# frozen_string_literal: true
module ApplicationHelper
  def flash_class(level)
    { notice: '', error: 'flash-error', alert: 'flash-warn' }[level]
  end

  def sidemenu_link_to(text, path, options = {})
    css_class = 'menu-item'
    css_class += ' selected' if current_page?(path)
    options.merge!(class: css_class)
    if options[:icon].present?
      link_to(path, options) do
        "<span class='octicon octicon-#{options[:icon]}'></span>#{text}".html_safe
      end
    else
      link_to(text, path, options)
    end
  end
end
