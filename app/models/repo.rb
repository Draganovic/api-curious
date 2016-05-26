class Repo
  attr_reader :service

  def initialize(current_user)
    @service = GithubService.new(current_user)
  end

  def all
    temp_repos_hash = service.repos_hash
    temp_repos_hash.map do |individual_hash|
      { name: individual_hash["name" ], html_url: individual_hash["html_url"]}
    end
  end

end
