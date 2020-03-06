class Job < ApplicationRecord


  has_rich_text :description
  belongs_to :user
  belongs_to :category
  has_one_attached :logo
  has_many :jobapplications
 

   geocoded_by :full_address
   after_validation :geocode
   
  validates :title, presence: true
  validates :description, presence: true


def full_address
  [city, state].join(', ')

end
  def self.search(params)
jobs = Job.where(category_id: params[:category].to_i)
jobs = jobs.where("title like ? or description like ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present? 
jobs = jobs.near(params[:location], 20) if params[:location].present?
jobs
  end

end
