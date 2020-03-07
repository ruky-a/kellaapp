class Jobapplication < ApplicationRecord
   belongs_to :user
  belongs_to :job
  has_one_attached :attachment_file
  enum status: [:Submitted]




   
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :attachment_file, presence: true
  

end
