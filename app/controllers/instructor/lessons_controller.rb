class Instructor::LessonsController < ApplicationController
  before_action :authenticate_user!

  def new
    if current_section.course.user != current_user
      return render plain: 'Unauthorized', status: :unauthorized
    end
    @lesson = Lesson.new
  end

  def create
    if current_section.course.user != current_user
      return render plain: 'Unauthorized', status: :unauthorized
    end
    @lesson = current_section.lessons.create(lesson_params)
    redirect_to instructor_course_path(current_section.course)
  end

  private

  helper_method :current_section
  def current_section
    @current_section ||= Section.find(params[:section_id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :content, :video)
  end
end 
 
 
 
 
