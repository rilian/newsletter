module ApplicationHelper
  def flash_class(level)
    case level
      when :notice then ''
      when :error then 'flash-error'
      when :alert then 'flash-warn'
    end
  end

  def sidemenu_link_to(text, path, options = {})
    css_class = "menu-item"
    css_class += " selected" if current_page?(path)
    options.merge!(class: css_class)
    if icon = options[:icon]
      link_to(path, options) do
        "<span class='octicon octicon-#{icon}'></span>#{text}".html_safe
      end
    else
      link_to(text, path, options)
    end
  end
end
