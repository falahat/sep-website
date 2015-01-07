class WelcomeController < ApplicationController
  def index
  	@ventures = Company.where(isVenture: true)
  end
end
