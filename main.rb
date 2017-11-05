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

# ************home page*****************/
get '/' do
	erb :home
end

get '/' do
	@user = current_user
	if @user
	erb :profile
	else
		redirect '/'
	end
end

# ************profile page*****************/

get '/profile' do
	# @user = User.create(title: params[:title], content: params[:content])
	if @user
		erb :profile
	else
		redirect '/'
	end
end

post '/profile' do
	@title = params[:title]
	@content = params[:content]
	redirect 'profile'
end

# ************edit account page*****************/

get '/edit_account' do
	erb :edit_account
end

post '/edit_account' do
	@user = User.update(name: params[:name], email: params[:email], password: [:password])
	redirect 'profile'
end

# ************blog page*****************/

get '/blog' do
	erb :blog
end

post 'blog' do
	@user = User.find_by(content: params[:content]).first
	erb :blog
end

# ************sign_in page*****************/

get '/sign_in' do
	# 	@user = User.find_by(email: params[:email], password: params[:password])
	# if @user
	# 	session[:user_id] = @user.id
	# 	redirect '/sign_in'
	# else
	# 	redirect '/'
	# end
		erb :profile
end

post '/sign_in' do
	@user = current_user(name: params[:name], email: params[:email], password: [:password])
end  

# ************create account page*****************/

get '/create_account' do
	erb :create_account
end

post '/create_account' do
	@user = User.create(params[:user])
	session[:user_id] = @user.id
	if @user
		session[:user_id] = @user.id
		redirect '/create_account'
	else
		redirect '/'
	end
end  

# ************sign_out page*****************/

get '/sign_out' do
	set :sessions, false
	redirect '/'
end

# ************delete account page*****************/

get '/delete_account' do
	redirect '/'
end

post '/delete_account' do
	@user = delete user account
	redirect '/'
end

	
	