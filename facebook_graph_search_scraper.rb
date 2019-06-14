require 'nokogiri'
require 'open-uri'
require 'csv'

#require 'mechanize'

document = Nokogiri::HTML(open("/absolute/path/to/html/file"))
file_name = "output_file_name"



friends = document.css(".FriendButton")
uids = []
friends.each do |f|
	puts result = f.to_s.match(/data-profileid=\"\d*\"/).to_s.gsub("data-profileid=\"", "").gsub("\"", "")
	uids << result
end

puts "Found #{uids.count} UIDs from the input file"

puts "======Generating CSV======="

#
#data.each do |row|
#	puts [row['id'].class].class
#end

CSV.open("/Users/raghavbagla/Desktop/csv/#{file_name}.csv", "wb") do |csv|
  uids.each do |uid|
	csv << [uid]
  end
end
puts "======Generating CSV Complete======="

