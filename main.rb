module Enumerable
  def my_each
    count = 0
    while count < self.length
      yield(self[count])
      count+=1
    end
  end
end

puts "my_each vs. each"
numbers = [1, 2, 3, 4, 5]
numbers.my_each { |item| puts item }
numbers.each { |item| puts item }