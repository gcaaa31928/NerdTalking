Rails.application.routes.draw do
    namespace :api do
        post 'articles/create' => 'articles#create'
        post 'articles/edit' => 'articles#edit'
        post 'articles/delete' => 'articles#delete'
        get 'articles' => 'articles#all'

    end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
