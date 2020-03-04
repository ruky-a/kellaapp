class Jobapplication < ApplicationRecord
   belongs_to :user
  belongs_to :job
  has_one_attached :attachment_file
  enum status: [:Submitted]
end
