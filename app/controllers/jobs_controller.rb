class JobsController < ApplicationController
    before_action :authenticate_user!
    before_action :redirect_non_employers, only: [:new, :create, :edit, :update, :destroy]

    def new
        @job = Job.new  
    end

    def create 
        @job = Job.new(jobs_params)

        if @job.save
            redirect_to location_job_path(@job.location, @job)
        else
            render :new
        end
    end

    def index
        if params[:location_id]
            @location = Location.find_by(params[:location_id])
            @jobs = @location.jobs
        else
            @jobs = Job.all
        end
    end

    def show
        @job = Job.find(params[:id])
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private 

    def jobs_params
        params.require(:job).permit(:title, :description, :pay, :location_id)
    end

    def redirect_non_employers
        if !current_user.employer
            redirect_to root_path
        end
    end
    
end
