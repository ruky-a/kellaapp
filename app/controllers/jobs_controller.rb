class JobsController < ApplicationController
before_action :authenticate_user!, :except => [:index, :show]





  def index
    @jobs = Job.all
  end

 def new

    @job = current_user.jobs.build
    @categories = Category.all
  end

  def create
    @job = current_user.jobs.build(job_params)

    if @job.save
      redirect_to root_path(@job), notice: "Saved..."
    else
         render :new, status: :unprocessable_entity
      end
  end

def show
 @job = Job.find(params[:id])
  end

def edit
    @categories = Category.all
end
 

 

  def job_params
   params.require(:job).permit(:title, :description, :salary, :location, :city, :state, :url, :qualifications, :benefits, :deadline, :company, :category_id, :logo)
  end
end
