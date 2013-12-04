Cooking::Engine.routes.draw do
  resources :ingredients
  
  resources :recipes do
    resources :steps do
      collection do
        patch 'update_sequences'
      end
    end
    resources :quantified_ingredients
  end
  root :to => 'recipes#index'
end
