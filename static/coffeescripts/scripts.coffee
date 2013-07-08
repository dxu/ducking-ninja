window.addEventListener 'message', (event) ->
   console.log 'got message'
   console.log event
window.postMessage hi: 'hi', '*'
