module FlattenArray
  VERSION = 1

  def self.flatten(array)
    array.compact.reduce([]) do |result, element| 
      if element.kind_of? Array
        result + flatten(element.compact)
      else
        result << element
      end
    end
  end
end
