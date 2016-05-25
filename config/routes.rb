Rails.application.routes.draw do
  root "home#show"

  # get    "/login",                 to: "sessions#new"/
  # post   "/login",                 to: "sessions#create"
  delete "/logout",                to: "sessions#destroy"

    get '/auth/github', as: :github_login
  # get "/auth/:provider/callback", as: :github_login
    get '/auth/github/callback', to: "sessions#create"

end
