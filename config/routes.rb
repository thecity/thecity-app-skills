ThecityAppSkills::Application.routes.draw do

  root :to => 'skills#index'

  ##################################################################
  ## Skills ##
  ##################################################################
  resources :skills, :only => [:index, :show]

  resource :skills, :only => [] do
    member do
      post :search
      post :send_email
    end
  end    

end
