module ETL
  def self.transform(old_values)
    old_values.each_with_object({}) do |(key, value), new_values|
      value.each { |letter| new_values[letter.downcase] = key }
    end
  end
end
