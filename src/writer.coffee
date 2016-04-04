module.exports = (opts) ->
  ical = require('ical-generator')
  cal = ical(name: 'Abfuhrtermine')
  # overwrite domain
  cal.domain 'sebbo.net'
  timeOffsetInHours = 0

  do->
    setTimeOffset: (offsetInHours)->timeOffsetInHours=offsetInHours
    createICalForSingleEvent: (event)->
      event = cal.createEvent
        start: new Date(event.date.getTime() - 1000*60*60*timeOffsetInHours)
        end: new Date(event.date.getTime() - 1000*60*60*(timeOffsetInHours-1))
        summary: event.type
        description: event.type
        location: event.street
      event.createAlarm({type: 'display', trigger: 300})
      event

    createICalForEvents: (events)->
      this.createICalForSingleEvent event for event in events

    toString: ()->cal.toString()

    events: cal.events()
