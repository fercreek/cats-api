Rails.application.routes.draw do
  resources :owners do
    resources :cats
  end
end
