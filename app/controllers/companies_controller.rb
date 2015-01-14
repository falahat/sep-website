class CompaniesController < ApplicationController
  def index
  end

  def ventures
  	@companies = Company.where(isVenture: true)
  	@title = "Ventures"
  end

  def connections
    @jobs = Job.all
    @categories = @jobs.group_by{ |c| c.category}
    puts @categories
  	@companies = Company.all
  	@title = "Careers"
  end

  def show
    @company = Company.find(params[:id])
  end
end
