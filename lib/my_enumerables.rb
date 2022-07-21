module Enumerable
  def my_all?
    my_each do |element|
      return false unless yield element
    end
    true
  end

  def my_any?
    my_each do |element|
      return true if yield element
    end
    false
  end

  def my_count
    return self.length unless block_given?

    count = 0
    my_each do |element|
      count += 1 if yield element
    end
    count
  end

  def my_inject(init = nil)
    result = init
    my_each do |element|
      if init.nil?
        result = element
        next
      end

      result = yield(result, element)
    end

    result
  end

  def my_map
    arr = []
    my_each do |element|
      arr << yield(element)
    end
    arr
  end

  def my_none?
    my_each do |element|
      return false if yield element
    end
    true
  end

  def my_select
    arr = []
    my_each do |element|
      arr << element if yield(element)
    end
    arr
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for element in self do
      yield element
    end
  end

  def my_each_with_index
    for i in (0..(self.length - 1)) do
      yield self[i], i
    end
    self
  end
end
