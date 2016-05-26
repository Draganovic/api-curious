class OrgsController < ApplicationController

  def index
    org = Org.new(current_user)
    @orgs = org.all
  end
end
