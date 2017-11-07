class User < ActiveRecord::Base
	# user.posts
	has_many :posts, dependent: :destroy
end

class Post < ActiveRecord::Base
	belongs_to :user
end