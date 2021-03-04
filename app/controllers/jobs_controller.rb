class JobsController < ApplicationController

    def new
        @job = Job.new  
    end

    def create 
        @job = Job.new(jobs_params)

        if @job.save
            redirect_to @job
        else
            render :new
        end
    end

    def index
        @jobs = Job.all
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
        params.require(:job).permit(:title, :description, :pay)
    end
    
end
