class SubscriptionPlan < ApplicationRecord
  belongs_to :user
  enum status: [:pending, :success]
end
