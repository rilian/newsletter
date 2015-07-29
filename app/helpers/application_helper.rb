module ApplicationHelper
  def flash_class(level)
    case level
      when :notice then ''
      when :error then 'flash-error'
      when :alert then 'flash-warn'
    end
  end
end
