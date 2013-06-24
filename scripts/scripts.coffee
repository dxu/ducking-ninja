do ->
  $ ->
    # attach that shit
    $('body').append (template = $ '''
      <div class="readmelater">
        <div class="readmelater-snapshot"></div>
        <div class="readmelater-info"></div>
      </div>
      '''; template)
    command_pressed = false

    # catch that shit
    $(window).keydown (e) ->
      if String.fromCharCode(e.keyCode).toLowerCase() == 's' and (e.ctrlKey or command_pressed)
        e.preventDefault()
        if dataStore = (JSON.parse localStorage.getItem('readmelater')) or {}
          if not (dataStore).hasOwnProperty document.URL
            localStorage.setItem 'readmelater', (dataStore[document.URL] = document.title; JSON.stringify dataStore)
            # add the active class, remove it in 100ms
            template.find('.readmelater-snapshot').addClass 'active'
            setTimeout (-> template.find('.readmelater-snapshot').removeClass 'active'), 500
          else if (info = template.find('.readmelater-info'); not info.hasClass 'active')
            info.html 'Already saved!'
            info.addClass 'active'
            setTimeout (-> info.removeClass 'active'), 3000
      else if e.keyCode == 91 then command_pressed = true

    $(window).keyup (e) ->
      if e.keyCode == 91 then command_pressed = false
    window.onblur = -> command_pressed = false

