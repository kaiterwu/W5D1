require 'byebug'

class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    self.prev.next = self.next 
    self.next.prev = self.prev 
  end
end

class LinkedList
include Enumerable

  def initialize
    @head, @tail = Node.new, Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
   @head.next
  end

  def last
    @tail.prev 
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    current_node = @head 
    until current_node == @tail 
     return current_node.val if current_node.key == key 
     current_node = current_node.next
    end     
  end

  def include?(key)
    current_node = @head 
    until current_node == @tail 
     return true if current_node.key == key 
     current_node = current_node.next
    end 
    false 
  end

  def append(key, val)
    new_node = Node.new(key,val)
    old_last_node = @tail.prev 
    old_last_node.next = new_node 
    @tail.prev = new_node 
    new_node.next,new_node.prev = @tail,old_last_node 
  end

  def update(key, val)
    current_node = @head 
    until current_node == @tail 
     current_node.val = val if current_node.key == key 
     current_node = current_node.next
    end     
  end

  def remove(key)
    current_node = @head 
    until current_node == @tail 
     current_node.remove if current_node.key == key 
     current_node = current_node.next
    end     

  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end


end
