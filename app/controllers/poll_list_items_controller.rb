class PollListItemsController < ApplicationController
  # PUT /poll_list_items/1.json
  def update
    @poll_list_item = PollListItem.find(params[:id])

    if @poll_list_item.users_voted.blank?
      params[:poll_list_item][:users_voted] = [params[:poll_list_item][:users_voted]]
    else
      params[:poll_list_item][:users_voted] = @poll_list_item.users_voted.push params[:poll_list_item][:users_voted].to_i
    end
    respond_to do |format|
      if @poll_list_item.update_attributes(params[:poll_list_item])
        format.json { render json: {item: @poll_list_item, other_items: PollListItem.where(poll_list_id: @poll_list_item.poll_list_id)} }
      else
        format.json { render json: @poll_list_item.errors, status: :unprocessable_entity }
      end
    end
  end
end
