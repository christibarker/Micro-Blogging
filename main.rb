require 'sinatra'
require 'sinatra/activerecord'

require './models'

set :database, "sqlite3:main.sqlite3"

get '/' do
	erb :home
end

get '/profile' do
	erb :profile
end

get '/edit_account' do
	erb :edit_account
end

get '/blog' do
	erb :blog
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
		