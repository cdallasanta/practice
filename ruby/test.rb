require 'benchmark'
require './quicksort.rb'

n = 10000
arrLength = 100
test


Benchmark.bm do |benchmark|
  benchmark.report("theirs: ") do
    n.times do
      test.sort
    end
  end

  # benchmark.report("QS:  ") do
  #   i = 0
  #   n.times do
  #     quickSort(test)
  #     puts i
  #     i += 1
  #   end
  # end

  benchmark.report("bubble: ") do
    n.times do
      bubbleSort(test)
    end
  end
end