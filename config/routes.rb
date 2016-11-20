Rails.application.routes.draw do
    namespace :api do

        resources :articles

        post 'issues/create' => 'issues#create'
        post 'issues/:id/edit' => 'issues#edit'
        post 'issues/:id/delete' => 'issues#delete'

        get 'issues' => 'issues#all'
        get 'issues/:id' => 'issues#show'

    end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
