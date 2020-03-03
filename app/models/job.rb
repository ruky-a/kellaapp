class Job < ApplicationRecord
  has_rich_text :description
  belongs_to :user
  belongs_to :category
  has_one_attached :logo
  validates :title, presence: true
  validates :company, presence: true
  validates :url, presence: true, uniqueness: true
end
