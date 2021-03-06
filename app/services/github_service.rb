class GithubService
attr_reader :current_user, :connection
  def initialize(current_user)
    @current_user = current_user
    @connection = Faraday.new(url: "https://api.github.com/")
    @connection.headers["Authorization"] = "token #{current_user.token}"
  end

  def get_repos
    @connection.get "user/repos?access_token=#{current_user.token}"
  end

  def repos_hash
    parse(get_repos)
  end

  def get_orgs
    @connection.get "users/#{current_user.nickname}/orgs"
  end

  def get_events
    @connection.get "users/#{current_user.nickname}/received_events"
  end

  def events_hash
    parse(get_events)
  end

  def get_actions
    @connection.get "users/#{current_user.nickname}/events"
  end

  def actions_hash
    parse(get_actions)
  end

  def orgs_hash
    parse(get_orgs)
  end

  def parse(response)
    JSON.parse(response.body, sybolize_names: true)
  end

end
