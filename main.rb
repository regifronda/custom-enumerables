module Enumerable
  def my_each
    count = 0
    while count < self.length
      yield(self[count])
      count+=1
    end
  end
  
  def my_each_with_index
    count = 0
    while count < self.length
      yield(self[count], count)
      count+=1
    end
  end

  def my_select
    array = Array.new
    self.my_each do |item|
      array << item if yield(item)
    end
    array
  end
end

puts "my_each vs. each"
numbers = [1, 2, 3, 4, 5]
numbers.my_each { |item| puts item }
numbers.each { |item| puts item }

# puts "my_each_with_index vs. each_with_index"
# numbers.my_each_with_index { |item, index| puts "#{index}: #{item}" }
# numbers.each_with_index { |item, index| puts "#{index}: #{item}" }

puts "my_select vs. select"
numbers.my_select { |item| puts item.even? }
numbers.select { |item| puts item.even? }