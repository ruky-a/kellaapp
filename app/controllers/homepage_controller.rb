class HomepageController < ApplicationController
before_action :authenticate_user!, :except => [:index, :show, :search]

  def index
  @courses = Course.all
   @categories = Category.all
  end


  def show
  @course = Course.find(params[:id])
   @categories = Category.all
  end

  def search 
   @categories = Category.all
  @courses = Course.search(params)
    @courses = Course.where("title like ? or description like ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
  @courses = Course.where(category_id: params[:category].to_i)

 
end

def plans
@plans = Stripe::Plan.list(product: 'prod_Gqg6Nz7fn84zrh')
end

end