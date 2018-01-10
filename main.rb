require "bundler"
Bundler.require(:default)

# Sinatra basically combines routes and controllers into one concept:
# 
# get "/some-route" do
#   # The whole controller action Ruby goes here.
# end

# So basically the whole web app lives in this one file:

get "/" do
  if currently_snowing?
    erb :snowing
  else
    erb :not_snowing
  end
end

# And since this is just a Ruby file, we can write functions that our web app 
# needs right here too:

def currently_snowing?
	api_key = "b2609cc19093c1afb68f0d7124993c7d"
	omaha_coordinates = "41.2524,-95.9980"

	api_url = "https://api.darksky.net/forecast/#{api_key}/#{omaha_coordinates}"

	response = HTTParty.get(api_url)

	response_hash = response.to_h

	current_weather = response_hash["currently"]

	if current_weather["summary"].include? "snow"
		return true
	else
		return false
	end
end