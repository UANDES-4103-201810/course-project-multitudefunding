class Category < ApplicationRecord
  # has_many :categorizations
  # has_many :projects, through: :categorizations
  has_many :categories_projects
  has_many :projects , :through => :categories_projects, source: :project, dependent: :delete_all
  validates :name, presence: true

  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%")
    else
      all
    end
  end
end
