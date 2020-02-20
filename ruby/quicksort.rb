require 'pry'

def bubbleSort(arr)
  swapped = true

  until swapped == false do
    swapped = false
    i = 0
    until i >= arr.length - 2 do
      if arr[i] > arr[i+1]
        temp = arr[i]
        arr[i] = arr[i+1]
        arr[i+1] = temp
        swapped = true
      end
      i += 1
    end
  end

  return arr
end

def quickSort(arr)
  if arr.length <= 1
    return arr
  end

  pivotInd = arr.length-1
  pivot = arr[pivotInd]
  p_index = 0
  i = 0
  until i == pivotInd do
    if arr[i] <= pivot
      swap(arr, i, p_index)
      p_index += 1
    end
    i+=1
  end
  swap(arr, pivotInd, p_index)

  if p_index == 0
    left = []
  else
    left = arr[0..p_index-1]
  end
  right = arr[p_index + 1..arr.length-1]

  arr = [*quickSort(left), pivot, *quickSort(right)]
end

def swap(arr, ind1, ind2)
  temp = arr[ind1]
  arr[ind1] = arr[ind2]
  arr[ind2] = temp
end