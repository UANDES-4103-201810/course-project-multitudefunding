class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :project_creators
  has_many :promise_buyers
  has_many :project_backers
  has_many :projects
  has_many :created, :through => :project_creators, source: :project
  has_many :bought, :through => :promise_buyers, source: :promise
  has_many :backed, :through => :project_backers, source: :project
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
