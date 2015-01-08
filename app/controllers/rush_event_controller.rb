class RushEventController < ApplicationController
  def application
  end

  def events
  	@events = RushEvent.all
  end
end
