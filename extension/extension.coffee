local = chrome.storage.local
sync = chrome.storage.sync

chrome.runtime.onMessage.addListener (request, sender, sendResponse) ->
  saving = {}
  saving[request.save.url] = request.save.data

  if request.save
    local.get request.save.url, (results) ->
      # check results
      if Object.keys(results).length > 0
        sendResponse error: 'Already saved!'
      else
        local.set saving, ->
          sendResponse success: 'Successfully saved!'
  else
    sendResponse error: 'Error saving webpage.'
  true
