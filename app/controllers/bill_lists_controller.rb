class BillListsController < ApplicationController
  # GET /bill_lists
  # GET /bill_lists.json
  def index
    @bill_lists = BillList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bill_lists }
    end
  end

  # GET /bill_lists/1
  # GET /bill_lists/1.json
  def show
    @bill_list = BillList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bill_list }
    end
  end

  # GET /bill_lists/new
  # GET /bill_lists/new.json
  def new
    @bill_list = BillList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bill_list }
    end
  end

  # GET /bill_lists/1/edit
  def edit
    @bill_list = BillList.find(params[:id])
  end

  # POST /bill_lists
  # POST /bill_lists.json
  def create
    @bill_list = BillList.new(params[:bill_list])

    respond_to do |format|
      if @bill_list.save
        format.html { redirect_to @bill_list, notice: 'Bill list was successfully created.' }
        format.json { render json: @bill_list, status: :created, location: @bill_list }
      else
        format.html { render action: "new" }
        format.json { render json: @bill_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bill_lists/1
  # PUT /bill_lists/1.json
  def update
    @bill_list = BillList.find(params[:id])

    respond_to do |format|
      if @bill_list.update_attributes(params[:bill_list])
        format.html { redirect_to @bill_list, notice: 'Bill list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bill_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bill_lists/1
  # DELETE /bill_lists/1.json
  def destroy
    @bill_list = BillList.find(params[:id])
    @bill_list.destroy

    respond_to do |format|
      format.html { redirect_to bill_lists_url }
      format.json { head :no_content }
    end
  end
end
