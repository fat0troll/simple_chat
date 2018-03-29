This application meets these requirements:

1. Uses PostgreSQL as database.
2. Have User model with ``email``, ``name`` and ``password`` fields.
3. User authorization controlled by Devise (regisration/authorization).
4. Have ChatMessage model, linked to users, with ``message_text`` field.
5. After successful login user redirects to chat page. Chat page is shared between all users. On chat page user must see messages from all other users in system and send messages. 
6. Sending messages is through AJAX, receiving — via WebSocket. Chat messages are live-streamed (no page refresh needed)
7. For web interface ``bootstrap`` used as CSS framework.