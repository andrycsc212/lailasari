require 'httparty'
require 'csv'
class Facebook
  include HTTParty
  base_uri 'https://graph.facebook.com'
  default_params "access_token" =>'Genereate this access token using the developer graph explorer'
  format :json
  
  def self.posts(page, limit = 5)
    get("/#{page}/posts", :query => {:limit => limit})
  end

  def self.events(page, limit = 5)
    get("/#{page}/events", :query => {:limit => limit})
  end
  
  def self.group_members(group_id)
    get("/#{group_id}/members")
  end
  
end

group_id = "127743947286025"
page_id = "1376495679276564"
response  = Facebook.group_members(group_id)
data = response.parsed_response['data']
puts "======Memebers downloaded COUNT======="
puts "Found #{uids.count} UIDs from the input file"
puts "==========="
#data.each do |row|
#	puts row
#end

puts "======Generating CSV======="

#
#data.each do |row|
#	puts [row['id'].class].class
#end

CSV.open("/Users/raghavbagla/Desktop/csv/#{group_id}.csv", "wb") do |csv|
  data.each do |row|
	csv << [row['id']]
  end
end
puts "======Generating CSV Complete======="

