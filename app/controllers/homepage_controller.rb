class HomepageController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]

  def index
 @categories = Category.all
  @courses = Course.all
  end


  def show
  @course = Course.find(params[:id])
  
  end

  def search 
   @categories = Category.all
  @courses = Course.search(params)
  @courses = Course.where(category_id: params[:category].to_i)
  @courses = Course.where("title like ? or description like ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?

 
end

end