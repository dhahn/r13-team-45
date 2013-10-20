class PollListsController < ApplicationController
  # GET /poll_lists
  # GET /poll_lists.json
  def index
    @poll_lists = current_user.room.poll_lists

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @poll_lists }
    end
  end

  # GET /poll_lists/1
  # GET /poll_lists/1.json
  def show
    @poll_list = PollList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @poll_list }
    end
  end

  # GET /poll_lists/new
  # GET /poll_lists/new.json
  def new
    @poll_list = PollList.new
    @poll_list.poll_list_items.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @poll_list }
    end
  end

  # GET /poll_lists/1/edit
  def edit
    @poll_list = PollList.find(params[:id])
  end

  # POST /poll_lists
  # POST /poll_lists.json
  def create
    @poll_list = PollList.new(params[:poll_list])

    respond_to do |format|
      if @poll_list.save
        format.html { redirect_to @poll_list, notice: 'Poll list was successfully created.' }
        format.json { render json: @poll_list, status: :created, location: @poll_list }
      else
        format.html { render action: "new" }
        format.json { render json: @poll_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /poll_lists/1
  # PUT /poll_lists/1.json
  def update
    @poll_list = PollList.find(params[:id])

    respond_to do |format|
      if @poll_list.update_attributes(params[:poll_list])
        format.html { redirect_to @poll_list, notice: 'Poll list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @poll_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poll_lists/1
  # DELETE /poll_lists/1.json
  def destroy
    @poll_list = PollList.find(params[:id])
    @poll_list.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
