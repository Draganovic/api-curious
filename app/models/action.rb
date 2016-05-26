class Action
  attr_reader :service

  def initialize(current_user)
    @service = GithubService.new(current_user)
  end

  def all
    temp_actions_hash = service.actions_hash
    temp_actions_hash.map do |individual_hash|
      { type: individual_hash["type"], repo: individual_hash["repo"]["name"]}
    end
  end
end
