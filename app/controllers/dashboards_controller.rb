class DashboardsController < ApplicationController
    before_action :authenticate_user!
  def show
@jobs = current_user.jobs
@courses = current_user.courses
 @jobapplications = current_user.jobapplications
  end
end
