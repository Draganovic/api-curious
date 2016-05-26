class Event
  attr_reader :service

  def initialize(current_user)
    @service = GithubService.new(current_user)
  end

  def all
    temp_events_hash = service.events_hash
    temp_events_hash.map do |individual_hash|
      { name: individual_hash["actor"]["login"], action: individual_hash["type"], project: individual_hash["repo"]["name"]}
    end
  end
end
