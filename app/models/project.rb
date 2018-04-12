class Project < ApplicationRecord
  belongs_to :user, :foreign_key => 'approved_by'
  has_and_belongs_to_many :categories
  has_many :project_creators
  has_many :project_backers
  has_many :promise_buyers
  has_many :users, :through => :project_creators
  has_many :users, :through => :project_creators
  has_many :promises
end
