$(document).on 'turbolinks:load', ->
    $('.alert-success').delay(1500).slideUp 400, ->
        $('.alert').alert 'close'
    $('.alert-danger').delay(1500).slideUp 400, ->
        $('.alert').alert 'close'