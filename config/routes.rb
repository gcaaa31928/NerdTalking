Rails.application.routes.draw do
    get 'views/index'

    namespace :api do

        resources :articles
        resources :issues

    end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
