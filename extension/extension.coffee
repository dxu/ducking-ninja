local = chrome.storage.local
sync = chrome.storage.sync

chrome.runtime.onMessage.addListener (request, sender, sendResponse) ->
  console.log 'received'
  console.log request
  saving = {}
  saving[request.save.url] = request.save.data

  if request.save
    local.get request.save.url, (results) ->
      # check results
      console.log 'got results'
      console.log results
      console.log Object.keys(results)
      console.log Object.keys(results).length
      if Object.keys(results).length > 0
        sendResponse error: 'Already saved!'
        console.log 'first'
      else
        local.set saving, ->
          sendResponse success: 'Successfully saved!'
        console.log 'second'
      console.log 'end'
  else
    sendResponse error: 'Error saving webpage.'
  true
