local = chrome.storage.local
sync = chrome.storage.sync

chrome.runtime.onMessage.addListener (request, sender, sendResponse) ->
  console.log 'here'

  if request.save
    saving = {}
    saving[request.save.url] = request.save.data
    local.get request.save.url, (results) ->
      # check results
      if Object.keys(results).length > 0
        sendResponse error: 'Already saved!'
      else
        local.set saving, ->
          sendResponse success: 'Successfully saved!'
  else if request.get
    if request.get == 'all'
      local.get null, (results) ->
        sendResponse results
  else
    sendResponse error: 'Error. Unidentified request'
  true


