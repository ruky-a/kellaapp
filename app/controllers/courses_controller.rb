class CoursesController < ApplicationController
   skip_before_action :authenticate_user!, :only => [:index, :show]
  def index
   @courses = Course.all
  
  end


  def show
    @course = Course.find(params[:id])
   @comment = Comment.new
    @joined = false

    if !current_user.nil? && !current_user.courses.nil?
      @joined = current_user.courses.include?(@course)
    end

    @review = Review.new
    @reviews = @course.reviews
    @hasReview = @reviews.find_by(user_id: current_user.id) if current_user
 



  end

   def search
     @courses = Course.where("active = ? AND courses.title ILIKE ? AND category_id = ?", true, "%#{params[:q]}%", params[:category])
    @q = params[:q]
    @courses = Course.search(params)
  end
end
