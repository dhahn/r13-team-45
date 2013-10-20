class CheckListItemsController < ApplicationController
  # PUT /check_list_items/1.json
  def update
    @check_list_item = CheckListItem.find(params[:id])

    respond_to do |format|
      if @check_list_item.update_attributes(params[:check_list_item])
        format.json { render json: @check_list_item }
      else
        format.json { render json: @check_list_item.errors, status: :unprocessable_entity }
      end
    end
  end
end
