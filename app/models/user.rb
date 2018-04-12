class User < ApplicationRecord
	has_many :project_creators
	has_many :project_backers
	has_many :promise_buyers
	has_many :projects, :through => :project_creators
	has_many :projects, :through => :project_backers
	has_many :promises, :through => :promise_buyers
end
