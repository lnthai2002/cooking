Cooking::Engine.routes.draw do
  resources :ingredients
  
  resources :recipes do
    resources :steps
    resources :quantified_ingredients
  end
end
