Rails.application.routes.draw do
  resources :importations
  resources :activities do 
    get "delete"
  end
  resources :checkouts do  
    get "delete"   
  end
  resources :payments do  
    get "delete"   
  end
  resources :remote_nafamas do  
    get "delete"   
  end
  resources :remote_unit_values do  
    get "delete"   
  end
  resources :shops do  
    get "delete"   
  end
  resources :localities do  
    get "delete"   
  end
  resources :cities do  
    get "delete"   
  end
  resources :payment_types do  
    get "delete"   
  end
  resources :return_unit_values do  
    get "delete"   
  end
  resources :send_unit_values do  
    get "delete"   
  end
  resources :customers do  
    get "delete"   
  end
  resources :customer_types do  
    get "delete"   
  end
  resources :agents do  
    get "delete"   
  end
  resources :sub_head_ponts do  
    get "delete"   
  end
  resources :head_ponts do  
    get "delete"   
  end
  resources :sub_head_pont_types do  
    get "delete"   
  end
  resources :head_pont_types do  
    get "delete"   
  end
  resources :companies
  resources :services do  
    get "delete"   
  end
  resources :permission_roles do  
    get "delete"   
  end
  resources :permissions do  
    get "delete"   
  end
  resources :roles do  
    get "delete"   
  end
  resources :profiles
  #devise_for :users

  get "/dashboard" => "dashboard#index" , as: :dashboard

  get "/importation" => "importations#importation_modal", as: :importation_modal
  post "importation" => "importations#importation", as: :post_importation

  get "/importation/:uid" => "activities#index", as: :activity_index


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

