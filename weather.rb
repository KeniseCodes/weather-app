require 'sinatra'
require 'yahoo_weatherman'

def get_weather(post)

client = Weatherman::Client.new
response = client.lookup_by_location(post)
return response.condition['text']

end


get '/' do
	erb :home
end

post '/weather' do
    post = params[:post]['location']
 
    @weather = get_weather(post).downcase
 
    "#{@weather}"
    
    if (@weather.include?'sun')
        erb :sunny
    elsif (@weather.include? 'cloudy')
        erb :cloudy
    elsif (@weather.include? 'snow')
        erb :snowy
    else
        erb :default
    end
end

#get '/:zipcode'	do
#zipcode = params[:zipcode]

#client = Weatherman::Client.new
#response = client.lookup_by_location(zipcode)

#"#{response.condition['text']}"
#end

