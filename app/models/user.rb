class User < ActiveRecord::Base
	ROLES = %w[admin customer]
	has_many :orders
end
