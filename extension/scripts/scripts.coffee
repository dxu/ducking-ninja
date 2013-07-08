window.addEventListener 'message', (event) ->
  data = event.data
  # check source, also check that it's from the website, not from the extension
  if event.source != window or not data.website
    return
  console.log 'got message eventi in content'
  console.log event
  # make sure it's from our website.
  # if document.URL != DOMAIN_URL
  # return
  console.log chrome.runtime
  chrome.runtime.sendMessage get: 'all', (res) ->
    console.log res
    console.log 'hello'
    window.postMessage extension: res, '*'
    console.log 'here'

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
        metadata = {data: {}}
        saveItem (metadata.url = document.URL; metadata.data.title = document.title ; metadata)

        # TODO: For localstorage
        # if dataStore = (JSON.parse localStorage.getItem('readmelater')) or {}
        #   if not (dataStore).hasOwnProperty document.URL
        #     localStorage.setItem 'readmelater', (dataStore[document.URL] = document.title; JSON.stringify dataStore)
        #     # add the active class, remove it in 100ms
        #     template.find('.readmelater-snapshot').addClass 'active'
        #     setTimeout (-> template.find('.readmelater-snapshot').removeClass 'active'), 500
        #   else if (info = template.find('.readmelater-info'); not info.hasClass 'active')
        #     info.html 'Already saved!'
        #     info.addClass 'active'
        #     setTimeout (-> info.removeClass 'active'), 3000

      else if e.keyCode == 91 then command_pressed = true

    $(window).keyup (e) ->
      if e.keyCode == 91 then command_pressed = false
    window.onblur = -> command_pressed = false

###
# saves it in the format:
# url:
# data:
#   title:
#   ...
###
saveItem = (metadata) ->
  chrome.runtime.sendMessage save: metadata, (res) -> console.log res

