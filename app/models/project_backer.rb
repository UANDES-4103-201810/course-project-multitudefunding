class ProjectBacker < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :user, :presence => true
  validates :project, :presence => true
  validates :amount_invested, numericality: {greater_than: 0}
end
