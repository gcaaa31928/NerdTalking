Rails.application.routes.draw do
    namespace :api do
        post 'articles/create' => 'articles#create'
        post 'articles/:id/edit' => 'articles#edit'
        post 'articles/:id/delete' => 'articles#delete'

        get 'articles' => 'articles#all'
        get 'articles/:id' => 'articles#show'

    end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
