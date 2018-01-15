ready = ->
  Typed.new '.element',
    strings: [
      'For Sale'
      "For Rent"
      "and Short Stay"
    ]
    typeSpeed: 500
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready