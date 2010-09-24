Cobook::Application.routes.draw do
  resources :users, :only => [:new, :create, :show]
  resource :account, :controller => 'users'
end
