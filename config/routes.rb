Rails.application.routes.draw do
  resources :services
  resources :permission_roles
  resources :permissions
  resources :roles
  resources :profiles
  #devise_for :users

  get "/dashboard" => "dashboard#index" , as: :dashboard


  get "/users"     => "custom_users#index", as: :all_users 
	get "/users/unregistered"     => "custom_users#unregistered", as: :unregistered_commission_percentage 
	post "/users/new"     => "custom_users#create", as: :create_user
	get "/users/new"     => "custom_users#new", as: :new_user
	get "/user/edit/:id" => "custom_users#edit", as: :edit_user
	patch "/user/update/:id" => "custom_users#update", as: :udapte_user
	delete "/user/destroy/:id" => "custom_users#destroy", as: :destroy_user
  get "/user/delete/:id" => "custom_users#delete", as: :delete_user
  
  get "/setup/admin" => "admin_setup#new", as: :new_admin
  post "/setup/admin/create" => "admin_setup#create", as: :create_admin


	get "/user/enable/:id" => "custom_users#get_enable", as: :get_enable_user_account
	post "/user/enable/:id" => "custom_users#post_enable", as: :post_enable_user_account
	get "/user/disable/:id" => "custom_users#get_disable", as: :get_disable_user_account
	post "/user/disable/:id" => "custom_users#post_disable", as: :post_disable_user_account



  devise_for :users, path: '', controllers: { 
    registrations: "users/registrations",
    confirmations: 'users/confirmations',
    passwords: "users/passwords",
    sessions: "users/sessions"
        
    }, 
    path_names: {
        sign_in: 'login', 
        sign_out: 'logout', 
        password: 'secret', 
        confirmation: 'verification', 
        unlock: 'unblock', 
        registration: 'signup', 
        sign_up: '' 
    }
   
    devise_scope :user do
      root to: "users/sessions#new"
      authenticated :user do
        root 'dashboard#index', as: :authenticated_root
      end
  
      unauthenticated do
        root 'users/sessions#new', as: :unauthenticated_root
      end
    end


    # Dynamic error pages
    get "/404", to: "errors#not_found"
    get "/422", to: "errors#unacceptable"
    get "/500", to: "errors#internal_error"


  

end
