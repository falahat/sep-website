class JobsController < ApplicationController
    def index
    end

    def connections
        @jobs = Job.all
        @categories = @jobs.group_by{ |c| c.category}
        puts @categories
        @companies = Company.all
        @title = "Careers"
    end

    def past

    end

    def show
        @company = Company.find(params[:id])
    end

    private
    def job_params
            params.require(:job).permit(:role, :description, :start, :end, :category, :brother)
    end

end
