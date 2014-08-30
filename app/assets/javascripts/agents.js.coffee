# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("select#agent_default_contact").on("ajax:success", (e) ->
    code = 'li#' + $(this).val()
    $("li.contact").removeClass("default")
    $(code).addClass("default")
  )
