class CreateChatMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :chat_messages do |t|
      t.integer :user_id
      t.text :message_body

      t.timestamps
    end
  end
end
