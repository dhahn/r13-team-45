class RoomsController < ApplicationController
  skip_before_filter :verify_room_for_user, only: [:new, :create, :taggable_users]
  skip_authorize_resource :only => [:show, :taggable_users]

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    authorize! :manual, "Stop" if current_user.room_id != params[:id].to_i and !params[:id].blank?
    @room = Room.find(params[:id] || current_user.room_id)

    @feed = []
    @feed.concat Note.room_notes(current_user.room_id)
    @feed.concat @room.check_lists.limit(16)
    @feed.concat @room.poll_lists.limit(16)
    @feed.concat @room.bills.limit(16)
    @feed.concat @room.chore_lists.limit(16)
    @feed.sort_by{ |f| "updated_at" }

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @room }
    end
  end

  # GET /rooms/new
  # GET /rooms/new.json
  def new
    @room = Room.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @room }
    end
  end

  # GET /rooms/1/edit
  def edit
    @room = Room.find(params[:id])
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(params[:room])

    respond_to do |format|
      if @room.save
        update_user_room_id @room.id, current_user.id

        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render json: @room, status: :created, location: @room }
      else
        format.html { render action: "new" }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rooms/1
  # PUT /rooms/1.json
  def update
    @room = Room.find(params[:id])

    respond_to do |format|
      if @room.update_attributes(params[:room])
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url }
      format.json { head :no_content }
    end
  end

  # GET /taggable_users.json
  def taggable_users
    @names = []
    params[:q].each do |query|
      query = query.delete("@")
      @names.concat current_user.room.users.where("tag_name = ?", query).pluck(:tag_name)
    end

    respond_to do |format|
      format.json { render json: @names }
    end
  end

  private
    def update_user_room_id room_id, user_id
      User.find(user_id).update_attributes(room_id: room_id)
    end
end
