Beerss::Application.routes.draw do
  resource :beeminder, controller: :beeminder do
    get 'callback'
  end

  root to: 'dashboard#index'
end
