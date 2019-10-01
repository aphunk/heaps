

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heap_sort(list)
  heap = MinHeap.new
  
  list.each do |elem|
    heap.add(elem)
  end
  
  sorted = []
  heap.each do |elem|
    sorted << heap.remove(elem)
  end
  return sorted
end