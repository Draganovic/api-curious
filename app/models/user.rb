class User < ActiveRecord::Base

  def self.repos
    GithubService.new(self)
  end

  def self.get_user(auth)
    User.where(provider: auth[:provider], uid: auth[:uid]).first_or_create do |user|
      user.nickname = auth[:info][:nickname]
      user.name = auth[:info][:name]
      user.email = auth[:info][:email]
      user.image = auth[:info][:image]
      user.token = auth[:credentials][:token]
      user.followers = auth[:extra][:raw_info][:followers]
      user.following = auth[:extra][:raw_info][:following]
      user.save!
    end
  end

end
