class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :project_backers
  has_many :promise_buyers
  has_many :projects, :through => :project_creators
  has_many :projects, :through => :project_backers
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
