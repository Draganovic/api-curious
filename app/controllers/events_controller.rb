class EventsController < ApplicationController

  def index
    events = Event.new(current_user)
    @events = events.all
  end
end
