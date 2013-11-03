
removeField = (target, event) ->
  event.preventDefault()
  $(target).prev('input[type="hidden"]').val('1')
  $(target).closest(".question").hide()

addField = (target, event) ->
  event.preventDefault()
  time = new Date().getTime()
  regexp = new RegExp($(target).data('id'), 'g')
  $(target).before($(target).data('fields').replace(regexp,time))
  

jQuery ->
  $("form").on "click", ".destroy", (event) ->
    removeField(this, event)
  $("form").on "click", ".add_fields", (event) ->
    addField(this, event)
  
