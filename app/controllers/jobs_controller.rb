class JobsController < ApplicationController
  
  def index
  	@jobs = Job.all
  end

  def show
  	@job = Job.find(params[:id])
  end

  def new
  	@job = Job.new
  end

  def create
  	@job = Job.new(job_params)
    @job.save
    redirect_to jobs_path
	end

  def edit
    @job = Job.find params[:id]
  end

  def update
    @job = Job.find params[:id]
    @job.update job_params
    redirect_to jobs_path
  end

  def destroy
    Job.find(params[:id]).destroy
    flash[:success] = "Job deleted"
    redirect_to jobs_path
  end

  private

    def job_params
      params.require(:job).permit(:name, :description, :user_number)
    end
end
