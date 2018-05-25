class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :project_creators
  has_many :promise_buyers
  has_many :project_backers 
  has_many :created, :through => :project_creators, source: :project
  has_many :bought, :through => :promise_buyers, source: :project
  has_many :backed, :through => :project_backers, source: :project
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
