require 'pry'

def step(step, start, ending)
  def is_prime(n)
    if n <= 1
      return false
    elsif n == 2
      return true
    elsif n > 2 && n % 2 == 0
      return false
    end

    max_div = Math.sqrt(n).floor 
    i = 3
    while i <= 1 + max_div do
      if n % i == 0
        return false
      end
      i += 2
    end
    return true
  end
  
  current = start
  until current > ending - step do
    if is_prime(current) && is_prime(current + step)
      return [current, current+step]
    end
    current += 1
  end
end

p step(6,100,110)