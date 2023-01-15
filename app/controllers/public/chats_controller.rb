class Public::ChatsController < ApplicationController
  before_action :reject_non_related, only: [:show]
  def show
    @user = User.find(params[:id])
    rooms = current_user.members.pluck(:room_id)
    members = Member.find_by(user_id: @user.id, room_id: rooms)
    if members.nil?
      @room = Room.new
      @room.save
      Member.create(user_id: @user.id, room_id: @room.id)
      Member.create(user_id: current_user.id, room_id: @room.id)
    else
      @room = members.room
    end

    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
  end

  def create
    @chat = current_user.chats.new(chat_params)
    @chats = Chat.where(room_id: chat_params[:room_id])
    render :validater unless @chat.save
    @room = @chat.room
    @room.create_notification_dm(current_user, @chat.id)
    respond_to do |format|
    format.html { redirect_to request.referer }
    format.js
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end

  def reject_non_related
    user = User.find(params[:id])
    unless current_user.following?(user) && user.following?(current_user)
      redirect_to trainings_path
    end
  end
end