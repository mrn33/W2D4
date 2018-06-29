# O(n^2)
def quadratic_min(arr)
  arr.each do |el1|
    min = true
    arr.each do |el2|
      min = false if el2 < el1
    end
    return el1 if min 
  end
end

# O(n)
def linear_min(arr)
  min = arr[0]
  arr.each do |el|
    min = el if el < min
  end
  min
end

# O(n^2)
def sub_sum1(arr)
  sub_arr = []
  
  arr.each_index do |idx1|
    arr[idx1..-1].each_index do |idx2|
      sub_arr << arr[idx1..(idx1 + idx2)]
    end
  end
  
  largest = sub_arr[0][0]
  
  sub_arr.each do |curr_arr|
    sum = 0
    
    curr_arr.each do |el|
      sum += el
    end
    
    largest = sum if sum > largest
  end
  
  largest
end

# O(n)
def sub_sum2(arr)
  largest = arr[0]
  pointer = 1
  sub_sum = arr[0]
  
  until pointer == arr.length
    sub_sum += arr[pointer]
    largest = sub_sum if sub_sum > largest

    if sub_sum < 1
      sub_sum = 0
    end
    
    pointer += 1
  end
  
  largest
end