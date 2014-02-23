require_dependency "cooking/application_controller"

module Cooking
  class RecipesController < ApplicationController
    set_tab :add, :recipe, only: %w(new)
    set_tab :edit, :recipe, only: %w(edit)
    set_tab :list, :recipe, only: %w(index)
    set_tab :show, :recipe, only: %w(show)

    before_action :find_recipe, only:[:destroy,:edit,:edit_description,:show,:update]

    # GET /recipes/1/edit_description.js
    def edit_description
      respond_to do |format|
        format.js { render 'show_form' }
      end
    end

    # GET /recipes
    def index
      @recipes = Recipe.all
      respond_to do |format|
        format.html
      end
    end

    # GET /recipes/1
    def show
      respond_to do |format|
        format.html
      end
    end

    # GET /recipes/new.js
    def new
      @recipe = Recipe.new
      respond_to do |format|
        format.js { render 'show_form' }
      end
    end
  
    # GET /recipes/1/edit
    def edit
      respond_to do |format|
        format.html
      end
    end
  
    # POST /recipes.js
    def create
      @recipe = Recipe.new(recipe_params)
      respond_to do |format|
        if @recipe.save
          flash[:notice] = 'New recipe created, time to add detail!'
          format.js { render js:"window.location='#{edit_recipe_path(@recipe)}'" }
        else
          format.html { render 'show_form' }
        end
      end
    end
  
    # PATCH /recipes/1.js
    def update
      respond_to do |format|
        if @recipe.update_attributes(recipe_params)
          flash[:notice] = "#{@recipe.name} updated"
          format.js { render 'show_dialog' }
        else
          format.js { render 'show_form' }
        end
      end
    end
  
    # DELETE /recipes/1.js
    def destroy
      respond_to do |format|
        if @recipe.destroy
          flash[:notice] = "#{@recipe.name} removed"
          format.js { render js:"window.location='#{recipes_path}'" }
        else
          flash[:alert] = "#{@recipe.name} can't be removed"
          format.js { render 'show_dialog' }
        end
      end
    end

    private

    def find_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe)
            .permit(:name, :description, :image)
    end
  end
end
