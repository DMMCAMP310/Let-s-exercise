class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
    belongs_to :training, optional: true
    belongs_to :room, optional: true
    belongs_to :chat, optional: true
    belongs_to :visiter, class_name: 'User', foreign_key: 'visiter_id', optional: true
    belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
end
