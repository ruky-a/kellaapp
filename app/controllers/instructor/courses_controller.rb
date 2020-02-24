class Instructor::CoursesController < ApplicationController
  def new
 @course = Course.new
  end

  def create
    @course = current_user.courses.create(course_params)
    if @course.valid?

    redirect_to instructor_course_path(@course), notice: "Saved.."
  else
    render :new, status: :unprocessable_entity
  end
  end



  def show
    @course = Course.find(params[:id])
  end

  private

def course_params
  params.require(:course).permit(:title, :description, :cost)
end

end



