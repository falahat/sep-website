class CompaniesController < ApplicationController
  def index
  end

  def ventures
  	@companies = Company.where(isVenture: true)
  	@title = "Ventures"
  	render 'connections'
  end

  def connections
  	@companies = Company.where.not(logo_url: nil)
    @not_pictured = Company.where(logo_url: nil)
  	@title = "Connections"
  end

  def show
    @company = Company.find(params[:id])
  end
end
