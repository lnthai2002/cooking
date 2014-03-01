require_dependency "cooking/application_controller"

module Cooking
  class StepsController < ApplicationController
    before_action :find_recipe
    before_action :find_step, only: [:show, :edit, :update, :destroy]

    # GET /recipes/1/steps
    def index
      @recipe = Recipe.find(params[:recipe_id])
      @steps = @recipe.steps.to_a

      respond_to do |format|
        format.html
      end
    end

    # GET /recipes/1/steps/new.js
    def new
      @step = @recipe.steps.build
      respond_to do |format|
        format.js {render 'show_form'}
      end
    end

    # GET /recipes/1/steps/2/edit.js
    def edit
      respond_to do |format|
        format.js {render 'show_form'}
      end
    end

    # POST /recipes/1/steps.js
    def create
      @step = @recipe.steps.build(step_params)

      respond_to do |format|
        if @step.save
          format.js {render 'reload_list_and_close_dialog'}
        else
          format.js {render 'show_form'}
        end
      end
    end

    # PATCH /recipes/1/steps/2.js
    def update
      respond_to do |format|
        if @step.update_attributes(step_params)
          flash[:notice] = "Step #{@step.sequence_number} updated"
          format.js {render 'reload_list_and_update_dialog'}
        else
          format.js {render 'show_form'}
        end
      end
    end

    # DELETE /recipes/1/steps/2.js
    def destroy
      respond_to do |format|
        if @step.destroy
          #TODO: re-sort all sequence numbers of steps
          format.js { render 'reload_list'}
        else
          flash[:alert] = "Cannot remove this step!"
          format.js { render 'show_dialog'}
        end
      end
    end

    # PATCH /cooking/recipes/14/steps/update_sequences.json
    def update_sequences
      respond_to do |format|
        begin
          Step.transaction do #update all or nothing
            params[:recordid].each_with_index do |id, index|
              Step.update_all("sequence_number = #{index + 1}", ["id = ?", id])
            end
          end
          format.json { head :ok }
        rescue Exception=>e
          notice = 'Cannot update sequence, there is something wrong, developer has been notified'
          format.json { head 400 }
        end
      end
    end

    private

    def step_params
      params.require(:step)
            .permit(:description, :image, :sequence_number)
    end

    def build_new_step
      #build a new step, this new one does not have sequence_id YET
      @step = @recipe.steps.build
    end

    def find_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

    def find_step
      @step = @recipe.steps.find(params[:id])
    end
  end
end
