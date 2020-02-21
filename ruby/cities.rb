require 'pry'

s = "1A 2A,12A 13B"

def solution(n, s, t)
  ships = build_ships(s)
  t.split(' ').each do |target|
    check_hit(target, ships)
  end

  sank = ships.count {|s| s[:hits] >= s[:size]}
  partials = ships.count {|s| s[:hits] < s[:size] && s[:hits] > 0}
  
  return "#{sank} #{partials}"
end

def check_hit?(target, ships)
  target_coords = {
    x: target[0...-1].to_i,
    y: target[-1].ord
  }
  ships.each do |ship|
    if target_coords[:x] >= ship[:top][:x] && target_coords[:x] <= ship[:bottom][:x] && 
       target_coords[:y] >= ship[:top][:y] && target_coords[:y] <= ship[:bottom][:y]
      ship[:hits] += 1
    end
  end
  return false
end

def build_ships(ships)
  ships_list = []
  ships.split(',').each do |s|
    coords = s.split(' ')
    top = {x: coords[0][0...-1].to_i, y: coords[0][-1].ord}
    bottom = {x: coords[1][0...-1].to_i, y: coords[1][-1].ord}
    size = (bottom[:x] - top[:x] + 1) * (bottom[:y] - top[:y] + 1)
    ships_list << {
      hits: 0,
      size: size,
      top: top,
      bottom: bottom
    }
  end
  return ships_list
end



def out_of_bounds_check(n,s,t)
  coords_to_check = s.split(/[ ,]/) + t.split(' ')
  coords_to_check.each do |coord|
    if !(coord[-1].ord - 64).between?(1, n) ||
       !coord[0...-1].to_i.between?(1, n)
      raise ArgumentError.new "#{coord} is out of bounds for the board size provided (#{n})"
    end
  end
end

n = 3
s = "1A 2A,1A 1D"
t = "1X 12A"
p out_of_bounds_check(n,s,t)