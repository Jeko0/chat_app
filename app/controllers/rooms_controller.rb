class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room
  before_action :set_all_rooms 
  before_action :set_all_users

  def index
    render "index"
  end

  def create 
    @room = Room.create(name: params["room"]["name"])
  end

  def show 
    @single_room = Room.find(params[:id])
    @message = Message.new 
    @messages = @single_room.messages.order(created_at: :asc)
    render "index"
  end

  private

    def set_room 
      @room = Room.new
    end

    def set_all_rooms 
      @rooms = Room.public_rooms 
    end

    def set_all_users
      @users = User.all_except(current_user)
    end
end
