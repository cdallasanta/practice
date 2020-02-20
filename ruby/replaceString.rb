#!/usr/bin/ruby
require 'pry'

def solution(input, markers)
  lines = input.split("\n")
  edited = lines.map do |line|
    i = 0
    while i < line.length do
      if markers.include?(line[i])
        line = line[0..i-1]
      end
      i += 1
    end
    line.strip
  end
  
  edited.join("\n")
end


def checkComments(input, markers, expected)
  actual = solution(input, markers)
  p actual
  p expected
  p actual == expected
end

checkComments("apples, plums % and bananas\npears\noranges !applesauce", ["%", "!"], "apples, plums\npears\noranges")
checkComments("Q @b\nu\ne -e f g", ["@", "-"], "Q\nu\ne")