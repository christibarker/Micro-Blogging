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

get '/sign_in' do
	erb :sign_in
end

get '/other_user' do
	erb :other_user
end

post '/sign_in' do
	redirect '/'
end 

get '/create_account' do
	erb :create_account
end

post '/create_account' do
	redirect '/'
end 

get '/sign_out' do
	redirect '/'
end

get '/delete_account' do
	redirect '/'
end

# get '/thanks' do
# 	erb :thanks
# end
	
# post '/thanks' do
# 	p params
# 	@email = params[:email]
# 	@message = params[:message]
# 	erb :thanks
# end
# 		