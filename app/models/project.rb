class Project < ApplicationRecord
  belongs_to :user, optional: true, :foreign_key => 'approved_by'
  # has_many :categorizations
  # has_many :categories, through: :categorizations
  has_many :categories
  has_many :project_creators
  has_many :project_backers
  has_many :promise_buyers
  has_many :creators, :through => :project_creators, source: :user
  has_many :backers, :through => :project_backers, source: :user
  has_many :buyers, :through => :promise_buyers, source: :user
  has_many :promises
  has_attached_file :main_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :main_image, content_type: /\Aimage\/.*\z/
  accepts_nested_attributes_for :promises
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

  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%")
    else
      all
    end
  end


end
