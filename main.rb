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

def user_signed_in_?
	!session[:user_id].nil?
end

# ************home page*****************/
get '/' do
	@body_class = 'home'
	# @user = current_user
	# if @user
		erb :home
	# else
	# 	redirect '/profile'
	# end
end

# ************profile page*****************/

get '/profile' do
	@body_class = 'profile'
	@user = current_user
	@user_all = User.all.reject{|user| user == @user}
	@user = current_user
	if @user
		erb :profile
	else
		redirect '/'
	end
end


post '/create_post' do
	@user = current_user
	@user.posts.create(params[:post])
	redirect '/profile'
end



# ************edit account page*****************/

get '/edit_account' do
	@body_class = 'edit_account'
	@user = current_user
	if @user
		erb :edit_account
	else
		redirect '/'
	end
end

post '/edit_account' do
	@user = current_user
	@user.update(params[:user])
	redirect 'profile'
end

# ************blog page*****************/

get '/blog' do
	@body_class = 'blog'
		@post_all = Post.all
	erb :blog
end


# ************sign_in page*****************/

get '/sign_in' do
	@body_class = 'sign_in'
		erb :sign_in
end

post '/sign_in' do
	@user = User.find_by(params[:user])
	p params
	if @user
		session[:user_id] = @user.id
		redirect '/profile'
	else
		redirect '/sign_in'
	end  
end


# ************create account page*****************/

get '/create_account' do
	@body_class = 'create_account'
	erb :create_account
end

post '/create_account' do
	@user = User.create(params[:user])
	p params
	if @user
		session[:user_id] = @user.id
		redirect '/profile'
	else
		redirect '/create_account'
	end
end  

# ************sign_out page*****************/

get '/sign_out' do
		session[:user_id] = nil
		redirect '/'
end

# ************delete account page*****************/

get '/delete_account' do
	@user = current_user
	@user.destroy
	session[:user_id] = nil
	redirect '/'
end

# ************show page*****************/

# localhost:4567/show/1
get '/show/:id' do
	@body_class = 'show'
	@user_one = current_user
	@user = User.find(params[:id])
	@user_all = User.all.reject{|user| user == @user_one}
	erb :show
end

# ************edit posts page*****************/
get '/edit_posts/:id' do
	@body_class = 'edit_posts'
	@post = Post.find(params[:id])
	@user = current_user
	if @user
		erb :edit_posts
	else
		redirect '/'
	end
end

post '/update_post' do
	@body_class = 'update_posts'
	@user = current_user
	@user.posts.update(params[:post])
	redirect '/profile'
end

get '/delete_post/:id' do
	@post = Post.find(params[:id])
	@post.destroy
	redirect '/profile'
end


