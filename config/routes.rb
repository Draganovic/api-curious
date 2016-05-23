Rails.application.routes.draw do
  root "home#show"

    get '/auth/github', as: :github_login
  # get "/auth/:provider/callback", as: :github_login
  get '/auth/github/callback', to: "sessions#create"

end
