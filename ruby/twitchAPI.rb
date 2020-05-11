require 'pry'
require 'net/http'
require 'uri'
require 'json'
# clientID = "lgafs3kmmroihihwxqyo2he72x0veg"

=begin
def find_matches(user_id)
  def fetch_from_api(user_id, direction)
    clientID = "lgafs3kmmroihihwxqyo2he72x0veg"
    users = []

    uri = URI.parse("https://api.twitch.tv/helix/users/follows?#{direction}_id=#{user_id}&first=100")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    
    request = Net::HTTP::Get.new(uri.request_uri)
    request["Client-ID"] = clientID
    
    response = http.request(request)
    response_data = JSON.parse(response.body)
    users.append(*response_data["data"])
    
    until users.length >= response_data["total"]
      cursor = response_data["pagination"]["cursor"]
      uri = URI.parse("https://api.twitch.tv/helix/users/follows?#{direction}_id=#{user_id}&first=100&after=#{cursor}")
      
      request = Net::HTTP::Get.new(uri.request_uri)
      request["Client-ID"] = clientID

      response = http.request(request)
      response_data = JSON.parse(response.body)
      users.append(*response_data["data"])
    end
    
    return users
  end

  follows_user = fetch_from_api(user_id, "to")
  user_follows = fetch_from_api(user_id, "from")

  matches = []

  follows_user.each do |follower|
    user_follows.each do |followed|
      if follower["from_name"] == followed["to_name"]
        matches << follower["from_name"]
      end
    end
  end

  return matches
end
find_matches(264051522)
=end

clientID = "lgafs3kmmroihihwxqyo2he72x0veg"
uri = URI.parse("https://api.twitch.tv/helix/streams?language=en")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

request = Net::HTTP::Get.new(uri.request_uri)
request["Client-ID"] = clientID

response = http.request(request)
response_data = JSON.parse(response.body)
binding.pry