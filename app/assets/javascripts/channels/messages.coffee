$(() ->
  App.messages = App.cable.subscriptions.create {channel: 'MessagesChannel', id: $('#chat_id').val() },
    received: (data) ->
      $('#new_message')[0].reset()
      $('#chat').prepend data.message
)
