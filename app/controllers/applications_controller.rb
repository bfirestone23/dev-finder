class ApplicationsController < ApplicationController
    def new 
        @job = Job.find_by(id: params[:job_id])
        @application = @job.applications.build
    end

    def create 
        job = Job.find_by(id: params[:job_id])
        job.users << current_user
        @application = job.applications.new(application_params)
        
        if @application.save
            redirect_to job_application_path(job, @application)
        else
            render :new
        end
    end

    def show
        @application = Application.find_by(id: params[:id])
    end

    def edit
    end
    
    def update 
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
end