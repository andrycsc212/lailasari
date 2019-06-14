require 'nokogiri'
require 'open-uri'
require 'csv'

#require 'mechanize'

document = Nokogiri::HTML(open("/absolute/path/to/html/file"))
file_name = "output_file_name_goes_here"


# Might have to modify this parameter.
friends = document.css("._698")
uids = []
friends.each do |f|
	puts result = f.to_s.match(/id=\d*/).to_s.gsub("id=", "")
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

