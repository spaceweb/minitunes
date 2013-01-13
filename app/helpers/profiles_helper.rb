module ProfilesHelper
  def repeated(array)
    # Extract repeated elements in a Array
    counts = Hash.new(0)
    array.each{|val|counts[val]+=1}
    counts.reject{|val, count|count==1}.keys
  end
end
