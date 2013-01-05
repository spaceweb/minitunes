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

  def repeated(array)
    # Extract repeated elements in a Array
    counts = Hash.new(0)
    array.each{|val|counts[val]+=1}
    counts.reject{|val, count|count==1}.keys
  end
end
