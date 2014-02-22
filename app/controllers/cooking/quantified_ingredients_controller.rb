require_dependency "cooking/application_controller"

module Cooking
  class QuantifiedIngredientsController < ApplicationController
    def new
      @recipe = Recipe.find(params[:recipe_id])
      @quantified_ingredient = @recipe.quantified_ingredients.build #build new ingredient
      @quantified_ingredient.ingredient = Ingredient.new

      respond_to do |format|
        format.js  {render 'form'}
      end
    end

    def create
      @recipe = Recipe.find(params[:recipe_id])
      @quantified_ingredient = QuantifiedIngredient.new(quantified_ingredient_params)
      @quantified_ingredient.recipe_id = params[:recipe_id]

      respond_to do |format|
        if @quantified_ingredient.save
          flash[:notice] = "#{@quantified_ingredient.ingredient.name} added"
          format.js { render 'cooking/quantified_ingredients/created'}
        else
          format.js { render 'cooking/quantified_ingredients/form'}
        end
      end
    end
  
    def destroy
      if not params[:recipe_id].blank?
        delete_and_forward_to_recipe
      else
        delete_and_go_back_to_index
      end
    end

    def edit
      @recipe = Recipe.find(params[:recipe_id])
      @quantified_ingredient = @recipe.quantified_ingredients.find(params[:id])
      respond_to do |format|
        format.js  {render 'form'}
      end
    end

    def update
      @recipe = Recipe.find(params[:recipe_id])
      @quantified_ingredient = @recipe.quantified_ingredients.find(params[:id])

      respond_to do |format|
        if @quantified_ingredient.update_attributes(quantified_ingredient_params)
          flash[:notice] = "#{@quantified_ingredient.ingredient.name} updated"
          format.js { render 'cooking/quantified_ingredients/created'}
        else
          format.js { render 'cooking/quantified_ingredients/form'}
        end
      end
    end
private
    def create_and_forward_to_recipe
      quantified_ingredient = QuantifiedIngredient.new(params[:quantified_ingredient])
      quantified_ingredient.recipe_id = params[:recipe_id]
      respond_to do |format|
        if quantified_ingredient.save
          format.html { redirect_to edit_recipe_path(params[:recipe_id]), notice: 'An ingredient was successfully added.' }
          format.json { render json: quantified_ingredient, status: :created, location: quantified_ingredient }
        else
          format.html { redirect_to edit_recipe_path(params[:recipe_id]), notice: 'Error when creating ingredient' }
          format.json { render json: quantified_ingredient.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def delete_and_forward_to_recipe
      #TODO: also remove ingredient if there is no quantifiedIngrdient associate with it
      QuantifiedIngredient.find(params[:id]).destroy
  
      respond_to do |format|
        format.html { redirect_to edit_recipe_path(params[:recipe_id]) }
        format.json { head :ok }
      end
    end

    private

    def quantified_ingredient_params
      params.require(:quantified_ingredient)
            .permit(:quantity,
                    ingredient_attributes: [:name,:image])
    end
  end
end
