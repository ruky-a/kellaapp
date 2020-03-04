class JobapplicationsController < ApplicationController
 before_action :authenticate_user!


  def create
    job = Job.find(params[:job_id])
   if current_user == job.user

    flash[:alert] = 'you cannot apply for your own posting'
  else 

    @jobapplication = current_user.jobapplications.create(jobapplication_params)
    @jobapplication.job = job
    @jobapplication.title = job.title
    if @jobapplication.save
    flash[:notice] = 'Application submitted'
  end
  redirect_to job
    
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
params.require(:jobapplication).permit(:firstname, :lastname, :email, :phone, :message, :attachment_file)
end
end