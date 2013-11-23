addListeners = ->
  $(".sign-up #new_user").submit insertTimezone

insertTimezone = (e) ->
  e.preventDefault()
  timeInfo = detectTimezone()
  location = timeInfo[0]
  offsetInSeconds = parseInt(timeInfo[1]) * 60
  $("input#user_time_zone").attr("value", offsetInSeconds)
  $("input#user_location").attr("value", location)
  $(@).off("submit").submit()

detectTimezone = ->
  tz = jstz.determine_timezone()
  country = tz.timezone.olson_tz
  utcOffsetInMinutes = tz.key
  [country, utcOffsetInMinutes]

$ ->
  addListeners()
