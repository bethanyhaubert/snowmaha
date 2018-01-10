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
  true
  # TODO - This is where the API integration that actually gets weather data will go.
end