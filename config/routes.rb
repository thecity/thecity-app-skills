ThecityAppSkills::Application.routes.draw do

  root :to => 'skills#index'

  ##################################################################
  ## Skills ##
  ##################################################################
  resources :skills, :only => [:index, :show] do
    member do
      get :email_new
    end
  end

  resource :skills, :only => [] do
    member do
      post :search
      post :send_email
    end
  end    

end
