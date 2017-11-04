require 'sinatra'
require 'sinatra/activerecord'

require './models'

set :database, "sqlite3:main.sqlite3"
set :sessions, true

def current_user
	if session[:user_id]
		User.find(session[:user_id])
	end
end

get '/' do
	@user = current_user
	if @user
	erb :profile
	else
		redirect '/sign_in'
	end
end

get '/profile' do
	erb :profile
end

# post '/create_account' do
# 	@name = params[:name]
# 	@email = params[:email]
# 	@title = params[:title]
# 	@content = params[:content]
# 	erb :profile
# end

get '/edit_account' do
	erb :edit_account
end

post '/edit_account' do
	@name = params[:name]
	@email = params[:email]
	@password = params[:name]
	redirect 'profile'
end

get '/blog' do
	erb :blog
end

post 'blog' do
@user = User.find(content: params[:content]).first
@user = User.create(params[:content])
erb :blog
end

get '/sign_in' do
	erb :sign_in
end

post '/sign_in' do
	@user = User.find_by(email: params[:email], password: params[:password])
	if @user
		session[:user_id] = @user.id
		@name = params[:name]
		@email = params[:email]
		@title = params[:title]
		@content = params[:content]
		redirect '/profile'
	else
		redirect '/sign_in'
	end
end  

get '/create_account' do
	erb :create_account
end

post '/create_account' do
	@user = User.create(params[:user])
	session[:user_id] = @user.id
	@name = params[:name]
	@email = params[:email]
	@title = params[:title]
	@content = params[:content]
	redirect 'profile'
end  

get '/sign_out' do
	redirect '/'
end

get '/delete_account' do
	redirect '/'
end

post '/delete_account' do
	@user = delete user account
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