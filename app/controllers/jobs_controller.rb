class JobsController < ApplicationController
    before_action :authenticate_user!
    before_action :redirect_non_employers, except: [:show, :index]

    def new
        if params[:location_id]
            @location = Location.find_by(id: params[:location_id])
            @job = @location.jobs.new 
            render :new_from_location
        else
            @job = Job.new  
            @locations = Location.all
        end
    end

    def create 
        if params[:location_id]
            @location = Location.find_by(id: params[:location_id])
            @job = @location.jobs.new(jobs_params)
            @job.user = current_user

            if @job.save
                redirect_to location_job_path(@job.location, @job)
            else
                render :new_from_location
            end
        else
            @job = Job.new(jobs_params)
            @job.user = current_user
            
            if !params[:job][:city].empty?
                location = Location.find_or_create_by(city: params[:job][:city])
                @job.location = location
            end

            if @job.save
                redirect_to location_job_path(@job.location, @job)
            else
                @locations = Location.all
                render :new
            end
        end
    end

    def index
        if params[:location_id]
            @location = Location.find_by(id: params[:location_id])
            @jobs = @location.jobs
        else
            @jobs = Job.all
        end
    end

    def show
        @job = Job.find_by(id: params[:id])
    end

    def edit
        @job = Job.find_by(id: params[:id])
        @location = @job.location
        @locations = Location.all
    end

    def update
        @job = Job.find_by(id: params[:id])

        @job.update(jobs_params)

        if !params[:job][:city].empty?
            location = Location.find_or_create_by(city: params[:job][:city])
            @job.location = location
        end

        if @job.save
            redirect_to location_job_path(@job.location, @job)
        else
            render :new_from_location
        end
    end

    def destroy
        @job = Job.find_by(id: params[:id])
        @job.destroy
        redirect_to jobs_url, notice: "Job was successfully deleted."
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
