Rails.application.routes.draw do
    get 'views/index'

    namespace :api do
        get 'articles/hottest' => 'articles#hottest'
        get 'issues/latest' => 'issues#latest'

        resources :articles
        resources :issues



    end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
