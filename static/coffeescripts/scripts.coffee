

# make the request to get all data
window.postMessage website: 'get', '*'

window.addEventListener 'message', (event) ->
   console.log 'got message'
   console.log event
   # event.data
