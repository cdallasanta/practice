require 'pry'

def validateCity(city)
  actualCities = [
  "Seattle, Washington",
  "Salem, Washington",
  "Minneappolis-Saint Paul, Washington",
  "Little Rock-Ridge, Washington",
  "San Louis Obispo, Washington",
  "New Town, Washington",
  "Early-Hyphen-Late Space, Washington"
]

  actualCities.include?(city)
end

def checkCity(city)
  cityArray = city.split('-')
  state = ", " + cityArray[cityArray.length-1]
  if cityArray.length > 2
    testCity(cityArray[0], cityArray.slice(1, cityArray.length-2))
  else
    validateCity(cityArray[0] + state)
  end
end

def testCity(left, right)
  if right.length == 0
    return validateCity(left + ", Washington")
  else
    newRight = right.slice(1, right.length)
    
    return testCity("#{left}-#{right[0]}", newRight) || testCity("#{left} #{right[0]}", newRight)
  end
end




p "Seattle: " + checkCity("Seattle-Washington").to_s
p "Steattle: " + checkCity("Steattle-Washington").to_s
p "San-Louis-Obispo: " + checkCity("San-Louis-Obispo-Washington").to_s
p "Early-Hyphen-Late-Space: " + checkCity("Early-Hyphen-Late-Space-Washington").to_s
p "New-Town: " + checkCity("New-Town-Washington").to_s
p "NewTown: " + checkCity("NewTown-Washington").to_s