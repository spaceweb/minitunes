module ApplicationHelper

  def flash_class(type)
    case type
    when :notice
      "alert-success"
    when :alert
      "alert-error"
    when :warning
      "alert-error"
    else
      ""
    end
  end

  def uri(string)
    URI.parse(URI.encode(string))
  end
end
