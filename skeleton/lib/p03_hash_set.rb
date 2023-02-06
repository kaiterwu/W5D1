class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    self[key] << key
    @count += 1
    self.resize! if @count == num_buckets
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if self[key].include?(key)
      self[key].delete(key) 
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    original_size = num_buckets
    flat_store = my_flatten(@store)

    if num_buckets <= flat_store.length 
      new_arr = Array.new(original_size*2){Array.new}
      flat_store.each{|ele|new_arr[ele.hash%new_arr.length] << ele}
      @store = new_arr 
    end 

  end

  def my_flatten(arr)
    flattened = [] 
    arr.each{|sub|flattened.concat(sub)}
    flattened 
  end 
end
