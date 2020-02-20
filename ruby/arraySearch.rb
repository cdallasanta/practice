require 'pry'

def breadthFirst(arr, item)
  copy = arr.clone

  i = 0
  until i >= copy.length
    if copy[i].kind_of?(Array)
      copy.push(*copy[i])
      copy.delete_at(i)
    else
      if copy[i] == item
        p i
        return true
      end
      i += 1
    end
  end

  p i
  return false
end

def depthFirst(arr, item)
  i = 0
  until i >= arr.length
    if arr[i] == item
      p i
      return true
    elsif arr[i].kind_of?(Array)
      if depthFirst(arr[i], item)
        p i
        return true
      end
    end
    i += 1
  end

  p i
  return false
end


testArr = [1,2,3,4,[1,[2,4,[7,6]]],5,6]
puts breadthFirst(testArr, 5)
puts depthFirst(testArr, 5)