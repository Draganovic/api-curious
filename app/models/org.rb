class Org
  attr_reader :service

  def initialize(current_user)
    @service = GithubService.new(current_user)
  end

  def all
    temp_orgs_hash = service.orgs_hash
    temp_orgs_hash.map do |individual_hash|
      { login: individual_hash["login"]}
    end
  end

  # def save
  #   Repo.service.create_repo(self.to_h)
  # end

end
