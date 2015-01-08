class WelcomeController < ApplicationController
  def index
  	@ventures = Company.where(isVenture: true)
  end

  def about_us


  end

end
