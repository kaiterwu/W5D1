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
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
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

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
