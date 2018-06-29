# O(n^2)
def bad_two_sum?(arr, target_sum)
  arr.each_with_index do |el1, idx1|
    arr[idx1 + 1..-1].each do |el2|
      return true if el1 + el2 == target_sum
    end
  end
  
  false
end


# O(n^2) - quicksort may run faster than bad_two_sum's O(n^2) time
# The lower bound is raised because we sort the array before looking for target
def okay_two_sum?(arr, target_sum)
  sorted = arr.sort
  small_idx = 0
  large_idx = arr.length - 1
  
  until small_idx >= large_idx
    sum = arr[small_idx] + arr[large_idx]
    return true if sum == target_sum
    
    if sum > target_sum
      large_idx -= 1
    else
      small_idx += 1
    end 
  end
  
  false
end


def hash_two_sum?(arr, target_sum)
  vals = {}
  
  arr.each do |el|
    vals[el] = true
  end
  
  vals.keys.each do |el|
    comp = target_sum - el
    return true if vals.include?(comp) && comp != el
  end
  
  false
end

arr = [0, 1, 5, 7]
p hash_two_sum?(arr, 6) # => should be true
p hash_two_sum?(arr, 10) # => should be false
