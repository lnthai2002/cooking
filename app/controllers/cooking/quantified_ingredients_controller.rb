require_dependency "cooking/application_controller"

module Cooking
  class QuantifiedIngredientsController < ApplicationController
    before_action :find_recipe
    before_action :find_quantified_ingredient, only:[:destroy,:edit,:update]

    def new
      @quantified_ingredient = @recipe.quantified_ingredients.build
      @quantified_ingredient.ingredient = Ingredient.new
      respond_to do |format|
        format.js { render 'show_form' }
      end
    end

    def create
      @quantified_ingredient = QuantifiedIngredient.new(quantified_ingredient_params)
      @quantified_ingredient.recipe_id = params[:recipe_id]
      respond_to do |format|
        if @quantified_ingredient.save
          flash[:notice] = "#{@quantified_ingredient.ingredient.name} added"
          format.js { render 'reload_list'}
        else
          format.js { render 'show_form'}
        end
      end
    end
  
    def destroy
      respond_to do |format|
        if @quantified_ingredient.destroy
          flash[:notice] = "#{@quantified_ingredient.ingredient.name} removed"
          format.js { render 'reload_list' }
        else
          flash[:alert] = "#{@quantified_ingredient.ingredient.name} cannot be removed"
          format.js { render 'show_dialog' }
        end
      end
    end

    def edit
      respond_to do |format|
        format.js  {render 'show_form'}
      end
    end

    def update
      respond_to do |format|
        if @quantified_ingredient.update_attributes(quantified_ingredient_params)
          flash[:notice] = "#{@quantified_ingredient.ingredient.name} updated"
          format.js { render 'reload_list' }
        else
          format.js { render 'show_form' }
        end
      end
    end

    private

    def find_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

    def find_quantified_ingredient
      @quantified_ingredient = @recipe.quantified_ingredients.find(params[:id])
    end

    def quantified_ingredient_params
      params.require(:quantified_ingredient)
            .permit(:quantity,
                    ingredient_attributes: [:name,:image])
    end
  end
end
