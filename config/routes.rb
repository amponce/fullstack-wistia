FullstackWistia::Application.routes.draw do
  resources :people, only: [:index] do
    collection { post :import }
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "people#index"
end
