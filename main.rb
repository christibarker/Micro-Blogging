require 'sinatra'
require 'sinatra/activerecord'

require './models'

set :database, "sqlite3:main.sqlite3"

get '/' do
	erb :home
end

get '/blank_one' do
	erb :blank_one
end

get '/blank_two' do
	erb :blank_two
end

get '/blank_two' do
	erb :blank_two
end

get '/thanks' do
	erb :thanks
end
	
post '/thanks' do
	p params
	@email = params[:email]
	@message = params[:message]
	erb :thanks
end
		