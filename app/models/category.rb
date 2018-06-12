class Category < ApplicationRecord
  # has_many :categorizations
  # has_many :projects, through: :categorizations
  has_many :projects , :through => :categories_projects, source: :project, dependent: :delete_all
  validates :name, presence: true
end
