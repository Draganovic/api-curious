require 'rails_helper'

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      extra: {
        raw_info: {
                    uid: "22222",
                    name: "Frank",
                    screen_name: "Tank",
                    avatar_url: "hahshshs",
                    followers: "3",
                    following: "5",
                    starred_url: "stars"
                    },

      },
      credentials: {
        oauth_token: "coffee",
        oauth_token_secret: "secretcoffee"
      },
          info: {
            nickname: "El Tank"
          }
      })
  end

RSpec.feature "user logs in with github" do
  scenario "user will access with github" do
    stub_omniauth
    visit "/"
    click_on "Sign in with Github"
    expect(page.status_code).to eq(200)
    expect(page).to have_content "El Tank"
    expect(page).to have_link "Logout"
  end

    scenario "user will logout from navbar" do
      stub_omniauth
      visit "/"
      click_on "Sign in with Github"
      expect(page.status_code).to eq(200)
      expect(page).to have_content "El Tank"
      expect(page).to have_link "Logout"
      click_on "Logout"
      expect(page).to have_content "Welcome to Github Apicurious"
      expect(page).to have_content "Sign in with Github"
      expect(page).to_not have_content "El Tank"
    end
end
