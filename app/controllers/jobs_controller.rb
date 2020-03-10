class JobsController < ApplicationController
before_action :authenticate_user!, :except => [:index, :show, :search]


  def index
  @jobs = Job.all.order("created_at desc")
  @categories = Category.all
  end

 def new
    @job = Job.new
    @categories = Category.all
  end

  def create
    @job = current_user.jobs.build(job_params)

    if @job.save
      redirect_to root_path, notice: "Job Posted"
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

def search
@jobs = Job.search(params)
  @categories = Category.all
end
 

 

  def job_params
   params.require(:job).permit(:title, :description, :salary, :location, :city, :state, :url, :qualifications, :benefits, :deadline, :company, :category_id, :logo)
  end
end
