class ActionsController < ApplicationController

  def index
    actions = Action.new(current_user)
    @actions = actions.all
  end
end
