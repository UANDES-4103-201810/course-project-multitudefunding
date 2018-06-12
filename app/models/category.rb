class Category < ApplicationRecord
  # has_many :categorizations
  # has_many :projects, through: :categorizations
  has_many :projects
  validates :name, presence: true
end
