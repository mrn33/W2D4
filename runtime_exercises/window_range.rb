def max_windowed_range(arr, window_size)
  curr_max_range = nil
  curr_arr = []
  
  arr.each do |el|
    curr_arr << el
    
    if curr_arr.length == window_size
      range = curr_arr.max - curr_arr.min
      
      curr_max_range = range if curr_max_range.nil?
      curr_max_range = range if range > curr_max_range
      
      curr_arr.shift
    end
  end
  
  curr_max_range
end

class MyQueue
  def initialize
    @store = []
  end
  
  def peek
    @store[0]
  end
  
  def size
    @store.length 
  end 
  
  def enqueue(el)
    @store.unshift(el) 
  end
  
  def dequeue
    @store.pop 
  end 
  
  def empty?
    size == 0
  end 
end

class MyStack
  def initialize
    @store = []
  end
  
  def peek
    @store[-1]
  end
  
  def size
    @store.length
  end
  
  def empty?
    size == 0
  end 
  
  def pop
    @store.pop
  end
  
  def push 
    @store.push
  end 
  
end