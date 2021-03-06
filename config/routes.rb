Cobook::Application.routes.draw do
  resources :users, :only => [:new, :create] do
    resource :password,
      :controller => 'clearance/passwords',
      :only => [:create, :edit, :update]
  end
  
  resource :session,
    :controller => 'sessions',
    :only => [:new, :create, :destroy]
  
  resources :groups, :except => :show do
    resources :contacts
  end
  
  root :to => 'pages#index'
  match 'about' => 'pages#about', :as => 'about'
end
