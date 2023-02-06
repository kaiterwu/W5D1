class MaxIntSet
  def initialize(max)
    @max = max 
    @store=Array.new(@max+1){false}

  end

  def insert(num)
    is_valid?(num)
    store[num] = true 
  end

  def remove(num)
    is_valid?(num)
    store[num] = false 
  end

  def include?(num)
    is_valid?(num)
    store[num] 
  end
  attr_reader :store
  attr_writer :max 

  private

  def is_valid?(num)
    raise 'Out of bounds'if num < 0 || num > @max 
  end

  def validate!(num)#assume num is positive 
    (num-max).times do 
      store << false 
    end 
  end

end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num) if self[num].include?(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet < IntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  # def [](num)
  #   # optional but useful; return the bucket corresponding to `num`
  # end

  # def num_buckets
  #   @store.length
  # end

  def resize!
    original_size = num_buckets
    flat_store = my_flatten(@store)
    if num_buckets < flat_store.length 
      new_arr = Array.new(original_size*2){Array.new}
      flat_store.each{|ele|new_arr[ele%new_arr.length] << ele}
      @store = new_arr 
    end 

  end

  def my_flatten(arr)
    flattened = [] 
    arr.each{|sub|flattened.concat(sub)}
    flattened 
  end 
end
