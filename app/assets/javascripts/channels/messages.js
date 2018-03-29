App.messages = App.cable.subscriptions.create('MessagesChannel', {  
    received: function(data) {
        $('#chat-window').append(this.renderMessage(data));
        $('#chat-window').append($("<hr>"));
        $('#chat_message_message_body').val("");
        $('body').scrollTop(1E10); // Scroll a really HUGE amount to show added message right in bottom
    },

    renderMessage: function(data) {
        var messageObject = $("<div>").attr("class", "row").append($("<div>")
            .attr("class", "col-sm")
            .append($("<div>")
                .attr("class", "card border-dark")
                .append($("<div>")
                    .attr("class", "card-header")
                    .text(data.username)
                )
                .append($("<div>")
                    .attr("class", "card-body")
                    .append($("<p>")
                        .attr("class", "card-text")
                        .text(data.message)
                    )
                )
            )
        );
        return messageObject.prop("outerHTML");
    }
});