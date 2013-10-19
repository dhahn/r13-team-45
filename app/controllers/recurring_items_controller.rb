class RecurringItemsController < ApplicationController
  # GET /recurring_items
  # GET /recurring_items.json
  def index
    @recurring_items = RecurringItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recurring_items }
    end
  end

  # GET /recurring_items/1
  # GET /recurring_items/1.json
  def show
    @recurring_item = RecurringItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recurring_item }
    end
  end

  # GET /recurring_items/new
  # GET /recurring_items/new.json
  def new
    @recurring_item = RecurringItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recurring_item }
    end
  end

  # GET /recurring_items/1/edit
  def edit
    @recurring_item = RecurringItem.find(params[:id])
  end

  # POST /recurring_items
  # POST /recurring_items.json
  def create
    @recurring_item = RecurringItem.new(params[:recurring_item])

    respond_to do |format|
      if @recurring_item.save
        format.html { redirect_to @recurring_item, notice: 'Recurring item was successfully created.' }
        format.json { render json: @recurring_item, status: :created, location: @recurring_item }
      else
        format.html { render action: "new" }
        format.json { render json: @recurring_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recurring_items/1
  # PUT /recurring_items/1.json
  def update
    @recurring_item = RecurringItem.find(params[:id])

    respond_to do |format|
      if @recurring_item.update_attributes(params[:recurring_item])
        format.html { redirect_to @recurring_item, notice: 'Recurring item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recurring_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recurring_items/1
  # DELETE /recurring_items/1.json
  def destroy
    @recurring_item = RecurringItem.find(params[:id])
    @recurring_item.destroy

    respond_to do |format|
      format.html { redirect_to recurring_items_url }
      format.json { head :no_content }
    end
  end
end
