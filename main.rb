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

  def my_all?(&block)
    truthy_elements = my_select(&block)
    return true if truthy_elements.length == self.length

    false
  end

  def my_any?(&block)
    my_each do |i|
      return true if yield i
    end
    false
  end

  def my_none?(&block)
    my_each do |i|
      return false if yield i
    end
    true
  end

  def my_count
    array = Array.new
    self.my_each do |item|
      array << item if yield(item)
    end
    array.length
  end

  def my_map(proc = nil, &block)
    proc_to_execute = proc || block
    result = []
    my_each do |element|
      result << proc_to_execute.call(element)
    end
    result
  end

  def my_inject(initial=1)
    my_each { |x| initial = yield(initial, x) }
    return initial
  end
end

def multiply_els(array)
  array.my_inject { |product, number| product * number }
end

puts "my_each vs. each"
numbers = [1, 2, 3, 4, 5]
numbers.my_each { |item| puts item }
numbers.each { |item| puts item }

puts "my_map vs. map"
p numbers.my_map { |number| number + 1 }
p numbers.map { |number| number + 1 }

#puts "my_inject"
#second_array = [2, 4, 5]
#p multiply_els(second_array)

# puts "my_none? vs. none?"
# p numbers.my_none? { |number| number > 1 }
# p numbers.none? { |number| number > 1 }

# puts "my_any? vs. any?"
# p numbers.my_any? { |number| number > 1 }
# p numbers.any? { |number| number > 1 }

# puts "my_each_with_index vs. each_with_index"
# numbers.my_each_with_index { |item, index| puts "#{index}: #{item}" }
# numbers.each_with_index { |item, index| puts "#{index}: #{item}" }

# puts "my_select vs. select"
# numbers.my_select { |item| puts item.even? }
# numbers.select { |item| puts item.even? }

# puts "my_all? vs. all?"
# p numbers.my_all? { |number| number > 1 }
# p numbers.all? { |number| number > 1 }