$(document).on "page:change", ->
  $("select#agent_default_contact").on("change", (e) ->
    #alert "called"
    $(".edit_agent").submit()
  )
  $(".edit_agent").on("ajax:success", (evt, data, status, xhr) ->
    $("div.errors").html("Default contact setted.")
    #alert(data)
    code = 'li#' + data["default_contact"]
    $("li.contact").removeClass("default")
    $(code).addClass("default")
  ).on("ajax:error", (evt, xhr, status, error) ->
      alert "something wrong!"
      $('div.errors').html(xhr.responseText);
    )
