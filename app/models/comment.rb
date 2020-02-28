class Comment < ApplicationRecord
  belongs_to :course
  belongs_to :user
  validates :user_id, presence: true
  validates :course_id, presence: true

  default_scope -> { order(updated_at: :desc)}
end
