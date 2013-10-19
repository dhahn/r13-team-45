class ChoreListsController < ApplicationController
  # GET /chore_lists
  # GET /chore_lists.json
  def index
    @chore_lists = ChoreList.room_chore_lists(current_user.room_id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chore_lists }
    end
  end

  # GET /chore_lists/1
  # GET /chore_lists/1.json
  def show
    @chore_list = ChoreList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chore_list }
    end
  end

  # GET /chore_lists/new
  # GET /chore_lists/new.json
  def new
    @chore_list = ChoreList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chore_list }
    end
  end

  # GET /chore_lists/1/edit
  def edit
    @chore_list = ChoreList.find(params[:id])
  end

  # POST /chore_lists
  # POST /chore_lists.json
  def create
    @chore_list = ChoreList.new(params[:chore_list])

    respond_to do |format|
      if @chore_list.save
        format.html { redirect_to @chore_list, notice: 'Chore list was successfully created.' }
        format.json { render json: @chore_list, status: :created, location: @chore_list }
      else
        format.html { render action: "new" }
        format.json { render json: @chore_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chore_lists/1
  # PUT /chore_lists/1.json
  def update
    @chore_list = ChoreList.find(params[:id])

    respond_to do |format|
      if @chore_list.update_attributes(params[:chore_list])
        format.html { redirect_to @chore_list, notice: 'Chore list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chore_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chore_lists/1
  # DELETE /chore_lists/1.json
  def destroy
    @chore_list = ChoreList.find(params[:id])
    @chore_list.destroy

    respond_to do |format|
      format.html { redirect_to chore_lists_url }
      format.json { head :no_content }
    end
  end
end
