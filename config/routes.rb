Cooking::Engine.routes.draw do
  resources :ingredients
  
  resources :recipes do
    member do
      get 'edit_description'
      patch 'edit_description', action: :update_description
    end
    resources :steps do
      collection do
        get 'reorder_steps'
        patch 'update_sequences'
      end
    end
    resources :quantified_ingredients
  end
  root :to => 'recipes#index'
end
