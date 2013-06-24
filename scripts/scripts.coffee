do ->
  $ ->
    # attach
    $('body').append('<div class="readmelater-snapshot"></div> <div class="readmelater-info"></div>')

    command_pressed = false
    # catch that shit
    $(window).keydown (e) ->
      if String.fromCharCode(e.keyCode).toLowerCase() == 's' and (e.ctrlKey or command_pressed)
        e.preventDefault()
        if temp = localStorage.getItem('readmelater') or '{}'
          console.log document.URL
          console.log temp
          temp = JSON.parse(temp)
          # console.log 'inside'
          # console.log localStorage.getItem 'readmelater'
          # console.log document.URL
          # console.log document.URL in localStorage.getItem 'readmelater'
          # console.log JSON.parse localStorage.getItem 'readmelater'
          # console.log document.URL in JSON.parse localStorage.getItem 'readmelater'
          # a = JSON.parse localStorage.getItem 'readmelater'
          # console.log a[document.URL]
          if not (JSON.parse localStorage.getItem 'readmelater').hasOwnProperty(document.URL)
            localStorage.setItem 'readmelater', (temp[document.URL] = document.title; JSON.stringify temp)
            # add the active class, remove it in 100ms
            $('.readmelater-snapshot').addClass('active')
            setTimeout (-> $('.readmelater-snapshot').removeClass 'active'), 500
          else
            console.log 'yoo dude in here'
            $('.readmelater-info').html('Already saved!')
            $('.readmelater-info').addClass('active')
            setTimeout (-> $('.readmelater-info').removeClass 'active'), 4000
      else if e.keyCode == 91
        command_pressed = true

    $(window).keyup (e) ->
      if e.keyCode == 91
        command_pressed = false
    window.onblur = ->
      command_pressed = false

