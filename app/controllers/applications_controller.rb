class ApplicationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_job, only: [:new, :create, :index, :update]
    before_action :find_application, only: [:show, :update]
    before_action :redirect_employers, only: [:new, :create]

    def new 
        @application = @job.applications.build
    end

    def create 
        @application = @job.applications.new(application_params)
        
        if @application.save
            redirect_to job_application_path(@job, @application), notice: "Application successfully submitted."
        else
            render :new
        end
    end

    def show
    end

    def index
        @applications = @job.applications.order(created_at: :desc)
    end
    
    def update 
        @application.update(status: application_params[:status])
        redirect_to job_applications_path(@job), notice: "Application successfully updated."
    end

    private

    def application_params
        params.require(:application).permit(:previous_job, 
            :previous_experience, 
            :years_experience, 
            :cover_letter, 
            :date_available,
            :status,
            :user_id
        )
    end

    def set_job
        @job = Job.find_by(id: params[:job_id])
    end

    def find_application
        @application = Application.find_by(id: params[:id])
    end

    def redirect_employers
        if current_user.employer
            redirect_to root_path, notice: "You do not have access to that page."
        end
    end
end