class User < ActiveRecord::Base
	# user.posts
	has_many :posts 
end

class Post < ActiveRecord::Base
	belongs_to :user
end