class LessonsController < ApplicationController
    before_action :authenticate_user! 
      before_action :require_authorized_for_current_lesson, only: [:show]
 

  def show

  end

  private

   def require_authorized_for_current_lesson
    if !current_user.enrolled_in?(current_lesson.section.course)
      redirect_to course_path(current_lesson.section.course)
      flash[:alert] = "You must be enrolled to view"
    end
  end



  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end


