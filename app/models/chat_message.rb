class ChatMessage < ApplicationRecord
    belongs_to :user

    validates :message_body, :presence => true
end
