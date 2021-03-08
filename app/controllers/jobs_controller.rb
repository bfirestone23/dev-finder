class JobsController < ApplicationController
    before_action :authenticate_user!
    before_action :redirect_non_employers, only: [:new, :create, :edit, :update, :destroy]

    def new
        @job = Job.new  
        @locations = Location.all
    end

    def create 
        @job = Job.new(jobs_params)
        @job.users << current_user
        
        if !new_location_params[:city].empty?
            location = Location.find_or_create(new_location_params)
            @job.location = location
        end

        if @job.save
            redirect_to location_job_path(@job.location, @job)
        else
            @locations = Location.all
            render :new
        end
    end

    def index
        if params[:location_id]
            @location = Location.find_by(id: params[:location_id])
            if @location
                @jobs = @location.jobs
            end
        else
            @jobs = Job.all
        end
    end

    def show
        @job = Job.find_by(id: params[:id])
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

    def new_location_params
        params.require(:job).permit(:city)
    end

    def redirect_non_employers
        if !current_user.employer
            redirect_to root_path
        end
    end
    
end
