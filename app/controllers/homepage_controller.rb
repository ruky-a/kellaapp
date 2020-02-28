class HomepageController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]

  def index
  @courses = Course.all
  end


  def show
  @course = Course.find(params[:id])
  end
end