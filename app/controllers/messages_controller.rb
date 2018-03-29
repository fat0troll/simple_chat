class MessagesController < ApplicationController
    before_action :authenticate_user!

    def index
        @messages = ChatMessage.all
    end

    def create
        message = ChatMessage.new(message_params)
        message.user = current_user
        if message.save
            ActionCable.server.broadcast 'messages',
                message: message.message_body,
                username: message.user.name,
                usermail: message.user.email
            head :ok
        end
    end

    protected

    def message_params
        params.require(:chat_message).permit(:message_body)
    end
end
