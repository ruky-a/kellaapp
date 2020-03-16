class JobapplicationsController < ApplicationController
 before_action :authenticate_user!


  def create
    job = Job.find(params[:job_id])
   if current_user == job.user
    flash[:alert] = 'you cannot apply for your own posting'
    
  end
    @jobapplication = current_user.jobapplications.create(jobapplication_params)
    @jobapplication.job = job
    @jobapplication.title = job.title
    if @jobapplication.save
  redirect_to job, notice: "Application Submitted..."
    else
         render :new, status: :unprocessable_entity

   end
  end



def applications
@jobapplications = current_user.jobapplications
end
  
def job_applications
@jobs = current_user.jobs
end

  private



def jobapplication_params
params.require(:jobapplication).permit(:firstname, :lastname, :email, :phone, :message, :title, :attachment_file)
end
end