class User < ActiveRecord::Base


  def self.get_user(auth)
    User.where(provider: auth[:provider], uid: auth[:uid]).first_or_create do |user|
      user.nickname = auth[:info][:nickname]
      user.email = auth[:info][:email]
      user.image = auth[:info][:image]
      user.token = auth[:credentials][:token]
      user.save!
    end
  end
end
