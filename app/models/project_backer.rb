class ProjectBacker < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :user, :presence => true
  validates :project, :presence => true
  validates :amount_invested, numericaly: {greater_than: 0}
end
