class StaticPagesController < ApplicationController
    def home
        if current_user
            redirect_to messages_path
        end
    end
end
