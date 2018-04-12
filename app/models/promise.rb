class Promise < ApplicationRecord
  belongs_to :project
  validates :project, :presence => true
  validates :price, numericaly: {greater_than: 0}
  validates :description, length: {minimum: 10}
end
