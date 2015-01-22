class RushEventController < ApplicationController
  def application
  end

  def events
  	@events = RushEvent.all
  end

  private
  def rush_event_params
      params.require(:rush_event).permit(:name, :attire, :description, :custom_date_text, :subtitle, :time, :location)
  end
end
