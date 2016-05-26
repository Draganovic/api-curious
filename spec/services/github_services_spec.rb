require 'rails_helper'

describe GithubService do
  it "returns a list of repos for a user" do
    VCR.use_cassette("github_service#repos") do

    service = GithubService.new(current_user)

    repo_info = service.repos_hash

    expect(repo_info[0]["name"]).to eq "rush-hour-skeleton"
    end
  end

  it "returns a list of organizations for a user" do
    VCR.use_cassette("github_service#orgs") do
    service = GithubService.new(current_user)

    org_info = service.orgs_hash

    expect(org_info[0]["login"]).to eq "testorg222"
    end
  end
end
