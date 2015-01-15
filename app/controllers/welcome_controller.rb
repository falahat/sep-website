class WelcomeController < ApplicationController
  def index
  	@ventures = Company.where(isVenture: true)
  	@testimonials = Testimonial.all
  end

  def about_us


  end

end
