class LessonsController < ApplicationController
    before_action :authenticate_user! 
 

  def show
  end

  private

 


  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end


