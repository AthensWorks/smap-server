Smap::Application.routes.draw do

  namespace :v1 do
    resources :reactions, only: :index
    
    resources :smells, except: [:destroy, :update, :edit]
  end
end
