class HomepageController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]

  def index
  @courses = Course.all
  end
end