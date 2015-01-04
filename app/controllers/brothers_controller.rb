class BrothersController < ApplicationController
  def index
    @brothers = Brother.all
  end

  def show
    @brother = Brother.find(params[:id])
  end

  def new
    @brother = Brother.new()
  end

  def edit
  end

  def create
    @brother = Brother.new(brother_params)
 
    @brother.save
    redirect_to @brother
  end

  def update
    @brother = Brother.find(brother_params)
  end

  def destroy
  end

  def image(brother)
    if ((bro.image_url).nil?)
      return ('placeholder.png')
    else
      return (bro.image_url)
    end
  end

  private
  def brother_params
      params.require(:brother).permit(:name, :text, :grad_year, :pledge_class, :jobs, :companies)
    end
end
