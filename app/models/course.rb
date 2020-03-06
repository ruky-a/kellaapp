class Course < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  belongs_to :user
  has_many :sections
  has_one_attached :image
  has_many :enrollments
  has_many :subscriptions
  has_many :users, through: :subscriptions
  has_many :reviews
  has_many :comments
  belongs_to :category


 
  validates :title, presence: true
  validates :description, presence: true
  validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}

  def free?
    cost.zero?
  end

   def premium?
    ! free?
  end

  # def average_rating
  #   reviews.count == 0 ? 0 : reviews.average(:stars).round(1)
  # end

 def average_rating
    reviews.blank?  ? 0 : reviews.average(:stars).round(2)
  end

  def self.search(params)
    courses = Course.where(category_id: params[:category].to_i)
   courses = courses.where("title like ? or description like ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present? 
    courses
  end

end
