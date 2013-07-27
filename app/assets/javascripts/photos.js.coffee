# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


#---------To Delete Tag From Photo-----------------

$(document).on 'click', '.remove-tag', (event) ->
  event.preventDefault()
  $remove_btn = $(this).parent()
  $element = $(this).parent()
  $.ajax
    async: false
    type: "DELETE"
    url: $(this).attr("href")
    dataType: "json"
    contentType: "application/json; charset=utf-8"
    success: ->
      $remove_btn.removeClass("disabled")
      $element.fadeOut ->
        $element.remove()
    error: (e) ->
      $remove_btn.removeClass("disabled")
      alert "error"
    beforeSend: ->
      $remove_btn.addClass("disabled")