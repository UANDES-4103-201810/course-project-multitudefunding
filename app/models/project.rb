class Project < ApplicationRecord
  belongs_to :user, :foreign_key => 'approved_by'
  has_and_belongs_to_many :categories
  has_many :project_creators
  has_many :project_backers
  has_many :promise_buyers
  has_many :users, :through => :project_creators
  has_many :users, :through => :project_backers
  has_many :promises
  validates :money_goal, numericality: {greater_than: 0}
  validate :finish_date_after_creation_date?
  validates :description, length: { minimum: 10}
  validates :name, length: { minimum: 2}

  def finish_date_after_creation_date?
    if self.finish_date < Date.today
      errors.add(:finish_date, "Cannot make end date goal in the past")
    end
    self.finish_date > Date.today
  end

end
