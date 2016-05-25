class HomeController < ApplicationController
  def show
    repo = Repo.new(current_user)
    @repos = repo.all
  end
end
