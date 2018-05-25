class Project < ApplicationRecord
  belongs_to :user, optional: true, :foreign_key => 'approved_by'
  has_and_belongs_to_many :categories
  has_many :project_creators
  has_many :project_backers
  has_many :promise_buyers
  has_many :creators, :through => :project_creators, source: :project
  has_many :backers, :through => :project_backers, source: :project
  has_many :buyers, :through => :promise_buyers, source: :project
  has_many :promises
  has_attached_file :main_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :main_image, content_type: /\Aimage\/.*\z/
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
