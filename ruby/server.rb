#!/usr/bin/ruby

def assignServer(serversHash)
  # Step 1, build a hash with each server's probability assigned to a range between 0 and 1
  sum = serversHash.values.sum()
  percentageHash = {}
  lastBreakPoint = 0

  # assign each server a range between 0 and 1 based on its probability
  # e.g.: server Y's range is:
  # ["where X left off", "<- that plus Y's probability"] => [0.125, 0.375]
  serversHash.each do |serverName, size|
    probability = size / sum
    percentageHash[serverName] = [lastBreakPoint, lastBreakPoint + probability]
    lastBreakPoint += probability
  end

  # Step 2, get a random number between 0 and 1, and find the server assigned to that range
  randNum = rand
  percentageHash.each do |server, range|
    if randNum >= range[0] && randNum < range[1]
      return server
    end
  end
end

servers = {}
for server in ARGV
  serverArr = server.split(':')
  servers[serverArr[0]] = serverArr[1].to_f
end

puts assignServer(servers)