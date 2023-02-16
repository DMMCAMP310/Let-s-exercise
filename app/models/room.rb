class Room < ApplicationRecord
  has_many :notifications, dependent: :destroy
  has_many :chats
  has_many :members
  
  def create_notification_dm(current_user, chat_id, id)
    @multiple_member_records = Member.where(room_id: id).where.not(user_id: current_user.id)
    @single_member_record = @multiple_member_records.find_by(room_id: id)
    if @single_member_record.user_id != current_user
      notification = current_user.active_notifications.new(
        room_id: id,
        chat_id: chat_id,
        visited_id: @single_member_record.user_id,
        action: 'dm'
      )
      notification.save
    end
  end
end