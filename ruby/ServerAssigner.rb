require 'pry'

# This class receives a hash of server names and sizes, and returns a random server, where the
# probability of it being chosen is in relation to its size
# run with `ServerAssigner.assign(<servers and sizes>)`
# e.g. ServerAssigner.assign(X: 1, Y: 2, Z: 5)

class ServerAssigner
  @@percentageHash = {}

  def self.assign(serversHash = nil)
    # Step 1, build a hash with each server's probability assigned to a range between 0 and 1
    if serversHash != nil
      self.buildPercentageHash(serversHash)
    end

    # Step 2, get a random number between 0 and 1, and find the server assigned to that range
    randNum = rand
    @@percentageHash.each do |server, range|
      if randNum >= range[0] && randNum < range[1]
        return server
      end
    end
  end

  # assign each server a range between 0 and 1 based on its probability
  # e.g.: server :Y's range is ["where :X left off", "that plus :Y's probability"] => [0.125, 0.375]
  def self.buildPercentageHash(serversHash)
    sum = serversHash.values.sum{|n| n.to_f}
    @@percentageHash = {}
    lastBreakPoint = 0

    serversHash.each do |serverName, ratio|
      probability = ratio.to_f / sum
      @@percentageHash[serverName] = [lastBreakPoint, lastBreakPoint + probability]
      lastBreakPoint += probability
    end
  end
end

binding.pry