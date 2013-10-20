class ChoreListRecurringItemsController < ApplicationController
  # PUT /chore_list_items/1.json
  def update
    @chore_list_item = ChoreListRecurringItem.find(params[:id])

    respond_to do |format|
      if @chore_list_item.update_attributes(params[:chore_list_item])
        format.json { render json: @chore_list_item }
      else
        format.json { render json: @chore_list_item.errors, status: :unprocessable_entity }
      end
    end
  end
end
