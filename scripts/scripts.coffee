do ->
  $ ->
    # attach
    $('body').append('<div class="readmelater-snapshot"></div>')

    command_pressed = false
    # catch that shit
    $(window).keydown (e) ->
      if String.fromCharCode(e.keyCode).toLowerCase() == 's' and (e.ctrlKey or command_pressed)
        e.preventDefault()
        if temp = localStorage.getItem('readmelater') or '{}'
          console.log document.URL
          console.log temp
          temp = JSON.parse(temp)
          localStorage.setItem 'readmelater', (temp[document.URL] = document.title; JSON.stringify temp)

          # add the active class, remove it in 100ms
          setTimeout()
      else if e.keyCode == 91
        command_pressed = true

    $(window).keyup (e) ->
      if e.keyCode == 91
        command_pressed = false
    window.onblur = ->
      command_pressed = false

