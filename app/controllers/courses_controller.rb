class CoursesController < ApplicationController
   skip_before_action :authenticate_user!, :only => [:index, :show]
  def index
   @courses = Course.all
  end


  def show
    @course = Course.find(params[:id])
    @joined = false

    if !current_user.nil? && !current_user.courses.nil?
      @joined = current_user.courses.include?(@course)
    end

  end
end
