class PromiseBuyer < ApplicationRecord
  belongs_to :user
  belongs_to :promise
  validates :user, :presence => true
  validates :promise, :presence => true
end
