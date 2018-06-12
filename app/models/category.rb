class Category < ApplicationRecord
  # has_many :categorizations
  # has_many :projects, through: :categorizations
  has_and_belongs_to_many :projects
  validates :name, presence: true
end
