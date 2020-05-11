#!/usr/bin/ruby
require "pry"

class BingoCard
  @b_col = []
  @i_col = []
  @n_col = []
  @g_col = []
  @o_col = []

  def initialize
    @b_col = generate_column("b")
    @i_col = generate_column("i")
    @n_col = generate_column("n")
    @n_col[2] = "--"
    @g_col = generate_column("g")
    @o_col = generate_column("o")
    show_board
  end

  def show_board
    p ""
    p "------------------------"
    p "  B |  I |  N |  G |  O "
    p "------------------------"
    while @o_col.length > 0 do
      p " #{@b_col.pop} | #{@i_col.pop} | #{@n_col.pop} | #{@g_col.pop} | #{@o_col.pop} "
    end
  end

  private

  def generate_column(col)
    arr = []
    adder = 0
    case col
      when "b"
          adder = 1
      when "i"
          adder = 16
      when "n"
          adder = 31
      when "g"
          adder = 46
      when "o"
          adder = 61
      else
        adder = 0
    end

    5.times do
      num = rand(15) + adder
      while arr.include?(num) || arr.include?(" " + num.to_s) do
        num = rand(15) + adder
      end
      if num < 10
        num = " " + num.to_s
      end
      arr << num
    end

    return arr
  end
end


if ARGV == []
  BingoCard.new
elsif ARGV[0].to_i == 0 || ARGV.length > 1
  raise ArgumentError.new("Argument not recognized")
else
  ARGV[0].to_i.times do
    BingoCard.new
  end
end