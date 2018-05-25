class Promise < ApplicationRecord
  belongs_to :project
  validates :name, length: {minimum: 1}
  validates :project, :presence => true
  validates :price, numericality: {greater_than: 0}
  validates :description, length: {minimum: 10}
end
