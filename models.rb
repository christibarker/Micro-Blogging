class User < ActiveRecord::Base
	# user.posts
	has_many :posts, dependent: :destory
end

class Post < ActiveRecord::Base
	belongs_to :user
end