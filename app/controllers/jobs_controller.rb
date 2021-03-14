class JobsController < ApplicationController
    before_action :authenticate_user!
    before_action :redirect_applicants, except: [:show, :index]
    before_action :find_job, only: [:show, :edit, :update, :destroy]

    def new
        if params[:location_id]
            set_location
            @job = @location.jobs.new 
            render :new_from_location
        else
            @job = Job.new  
            get_all_locations
        end
    end

    def create 
        if params[:location_id]
            set_location
            @job = @location.jobs.new(jobs_params)
            @job.user = current_user

            if @job.save
                redirect_to location_job_path(@job.location, @job), notice: "Job successfully created."
            else
                render :new_from_location
            end
        else
            @job = Job.new(jobs_params)
            @job.user = current_user
            
            find_or_create_new_location

            if @job.save
                redirect_to location_job_path(@job.location, @job), notice: "Job successfully created."
            else
                get_all_locations
                render :new
            end
        end
    end

    def index
        if params[:location_id]
            set_location
            @jobs = @location.jobs.order(created_at: :desc)
        else
            @jobs = Job.all.order(created_at: :desc)
        end
    end

    def show
    end

    def edit
        @location = @job.location
        get_all_locations
    end

    def update
        @job.update(jobs_params)

        find_or_create_new_location

        if @job.save
            redirect_to location_job_path(@job.location, @job), notice: "Job successfully updated."
        else
            render :new_from_location
        end
    end

    def destroy
        @job.destroy
        redirect_to jobs_url, notice: "Job successfully deleted."
    end

    private 
    def jobs_params
        params.require(:job).permit(:title, :description, :location_id)
    end

    def find_or_create_new_location
        if !params[:job][:city].empty?
            location = Location.find_or_create_by(city: params[:job][:city])
            @job.location = location
        end
    end

    def find_job
        @job = Job.find_by(id: params[:id])
    end

    def set_location
        @location = Location.find_by(id: params[:location_id])
    end

    def get_all_locations
        @locations = Location.all
    end

    def redirect_applicants
        if !current_user.employer
            redirect_to root_path, notice: "You do not have access to that page."
        end
    end
end
