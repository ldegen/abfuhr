module.exports = (opts)->
  createICalForSingleEvent: (event)->
    ical = require('ical-generator')
    cal = ical(
      domain: 'sebbo.net'
      name: 'my first iCal')
    # overwrite domain
    cal.domain 'sebbo.net'
    cal.createEvent
      start: event.date
      end: event.date
      summary: event.type
      description: event.type
      location: event.street
      url: 'http://sebbo.net/'
    cal.toString()
  createICalForEvents: (events)->
    result = ''
    for event in events
      cal = this.createICalForSingleEvent event
      result += cal
    result