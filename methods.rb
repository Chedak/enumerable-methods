module Enumerable

  def my_each
    for i in self
      yield(i)
    end
    self
  end

  def my_each_with_index
    for i in (0...self.length)
      yield(self[i], i)
    end
    self
  end

  def my_select
    new_arr = []
    self.my_each do |i|
      new_arr.push(i) if yield(i)
    end
    new_arr
  end

  def my_all
    all_passed = true
    self.my_each do |i|
      if !yield(i)
        all_passed = false
        break
      end
    end
    all_passed
  end

  def my_any
    any = false
    self.my_each do |i|
      if yield(i)
        any = true
        break
      end
    end
    any
  end

  def my_none
    none = true
    self.my_each do |i|
      if yield(i)
        none = false
        break
      end
    end
    none
  end

  def my_count(num = nil)
    count = 0
    if !num && !block_given?
      count = self.length
    elsif num
      for i in self
        if i == num
          count += 1
        end
      end
    else
      for i in self
        if yield(i)
          count += 1
        end
      end
    end
    count
  end

  def my_map
    new_arr = []
    for i in self
      new_arr.push(yield(i))
    end
    new_arr
  end

  def my_inject(init = nil)
    start = init ? 0 : 1
    memo = init ? init : self[0]
    for i in (start...self.length)
      memo = yield(memo, self[i])
    end
    memo
  end

end


# Test my_inject method
def multiply_els(arr)
  arr.my_inject { |memo, item| memo * item }
end
