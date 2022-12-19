class Public::ChatsController < ApplicationController
  def show
    @user = User.find(params[:id])
    rooms = current_user.members.pluck(:room_id)
    members = Member.find_by(user_id: @user.id, room_id: rooms)
    if members.nil?
      @room = Room.new
      @room.save
      Member.create(user_id: current_user.id, room_id: @room.id)
      Member.create(user_id: @user.id, room_id: @room.id)
    else
      @room = members.room
    end
    
    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
  end
  
  def create
    @chat = current_user.chats.new(chat_params)
    render :validater unless @chat.save
  end
  
  private
  
  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end
  
end
