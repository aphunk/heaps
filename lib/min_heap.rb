class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(log n), where n is the number of nodes in heap
  # Space Complexity: O(log n), where n is the number of nodes in heap
  def add(key, value = key)
    @store << HeapNode.new(key, value)
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n), where n is the number of nodes in heap
  # Space Complexity: O(1)
  def remove()
    swap(0, @store.length - 1)
    answer = @store.pop
    heap_down(0)
    
    return answer.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    return @store.empty?
  end

  private
  # Time complexity: O(log n), where n is the number of nodes in heap
  # Space complexity: O(log n), where n is the number of nodes in heap
  def heap_up(index)
    return if index == 0
    
    parent = (index - 1) / 2
    if @store[parent].key > @store[index].key
      swap(parent, index)
      heap_up(parent)
    else
      return
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_child = index * 2 + 1
    right_child = index * 2 + 2
    
    if left_child > @store.length - 1
      return
    elsif right_child > @store.length - 1
      if @store[index].key > @store[left_child].key
        swap(left_child, index)
      end
      return
    end
    
    if @store[left_child].key < @store[right_child].key
      swap(left_child, index)
      heap_down(left_child)
    else
      swap(right_child, index)
      heap_down(right_child)
    end 
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end