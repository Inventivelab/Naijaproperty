jQuery(document).on 'turbolinks:load', ->
  reviews = $('#reviews')
  if reviews.length > 0
    App.global_chat = App.cable.subscriptions.create {
      channel: "UsersChannel"
      user_id: reviews.data('user-id')
    },
    connected: ->
    disconnected: ->
    received: (data) ->
      reviews.prepend data['review']
    send_review: (review, user_id) ->
      @perform 'send_review', review: review, user_id: user_id
  $('#new_review').submit (e) ->
    $this = $(this)
    textarea = $this.find('#review_content')
    if $.trim(textarea.val()).length > 1
      App.global_chat.send_review textarea.val(),
      reviews.data('user-id')
      textarea.val('')
    e.preventDefault()
    return false