class ReviewsController < ApplicationController


    def create
    @course = Course.find(params[:course_id])
    @course.reviews.create(review_params.merge(user: current_user))
    redirect_to course_path(@course)
  end

  private

  def review_params
    params.require(:review).permit(:review, :stars)
  end
end


# def create
# @review = Review.create(review_params)
# course = @review.course
# redirect_to course

# end




# def destroy
# @review = Review.find(params[:id])
# course = @review.course

# @review.destroy

# redirect_to course_path

# end

# private

# def review_params
# params.require(:review).permit(:stars, :review, :course_id, :user_id)
# end

# end