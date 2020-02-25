class Lesson < ApplicationRecord
  belongs_to :section 
  has_one_attached :video
  has_one_attached :thumbnail
end
