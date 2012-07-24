Photomix::Application.routes.draw do
  mount DeviseOmniauthEngine::Engine => "/", :as => "devise_omniauth"

  devise_scope :user do
    get '/login' => 'devise/sessions#new', :as => :login
    get '/signup' => 'devise/registrations#new', :as => :signup
    get '/logout' => 'devise/sessions#destroy', :as => :logout
    resource :account, :controller => :users, :as => :user_root
  end

  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"},
             :path_names => {:sign_out => 'logout'}

  resource :account, :controller => :users

  resources :photos do
    collection do
      get :untouched
      post :edit_multiple
      put :update_multiple
      get :upload
      get :scan
    end
  end
  resources :albums do
    collection do
      get :untouched
    end
    resources :tags do
      resources :photos do
        collection do
          get :untouched
          get :upload
          get :edit_multiple
        end
      end
    end
    resources :photos do
      collection do
        get :untouched
        get :upload
        get :edit_multiple
      end
    end
  end
  resources :collections do
    resources :albums do
      resources :photos do
        collection do
          get :untouched
          get :upload
          get :edit_multiple
        end
      end
    end
  end

  resources :tags, :shallow => true do
    resources :photos
    resources :albums
  end

  match '/locale' => "locale#set"

  root :to => "collections#index"

end
