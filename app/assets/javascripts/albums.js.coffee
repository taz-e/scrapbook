# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).on "change", ".active_image", (e) ->
  count = $('#hidden_fields input').length + 1
  files = $(this)[0].files
  destination = document.getElementById("uploadPreview")
  $("#new-image input").removeClass 'active_image'
  $("#new-image input").removeClass 'filestyle'
  $("#hidden_fields").append $("#new-image input")
  $("#new-image").html ''
  $("#new-image").append("<input type='file' id='add-new-image' class='filestyle active_image' name='album[photos_attributes][#{count}][image]'>")
  $(':file').filestyle({input:false;buttonText:'Add Image';classButton:'btn btn-success';classIcon:'icon-plus'})
  i = 0
  while i < files.length
    oFReader = new FileReader()
    oFReader.readAsDataURL files[0]
    oFReader.onload = (oFREvent) ->
      html = "<div class='span2 well'><img src=" + oFREvent.target.result + " style='width: 170px; height: 170px;'/>
              <br /><input type='text' style='width:156px;margin-top:10px' placeholder='Enter Image Name' name='album[photos_attributes][#{count - 1}][name]'>
              <hr /><a class='add-more-tags' id='#{count - 1}' style='cursor:pointer'><i class='icon-plus' > Add Tag</a></div>"
      $(destination).append(html)
    i++


$(document).on "click", ".add-more-tags", (event) ->
  event.preventDefault()
  photo_index = $(this).attr('id')
  $(this).before "<div class='input-append'><input type='text' class='span2' style='width:129px' placeholder='Enter Tag' name='album[photos_attributes][#{photo_index}][tags_attributes][][title]' id='appendedInput'>
                  <span class='add-on rem-tag'><i class='icon-remove'></i></span></div>"

$(document).on "click", ".rem-tag", (event) ->
  event.preventDefault()
  $element = $(this).parent()
  $element.fadeOut ->
    $element.remove()