# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).on "change", ".active_image", (e) ->
  files = $(this)[0].files
  destination = document.getElementById("uploadPreview")
  $("#add-new-image input").removeClass 'active_image'
  $("#add-new-image div").appendTo("#hidden_fields")
  $("#add-new-image").append("<input type='file' class='filestyle active_image' name='album[photos_attributes][][image]'>")
  $(':file').filestyle({input:false;buttonText:'Add Image';classButton:'btn btn-success';classIcon:'icon-plus'})
  i = 0
  while i < files.length
    oFReader = new FileReader()
    oFReader.readAsDataURL files[0]
    oFReader.onload = (oFREvent) ->
      html = "<div class='span2 well'><img src=" + oFREvent.target.result + " style='width: 170px; height: 170px;'/>
              <br /><input type='text' style='width:156px;margin-top:10px' placeholder='Enter Image Name' name='album[photos_attributes][][name]'>
              <br /><label for='name'>Tags</label><input type='text' style='width:156px'>
              <br /><a id='add-more-tags' style='cursor:pointer'><i class='icon-plus' > Add More Tag</a></div>"
      $(destination).append(html)
    i++