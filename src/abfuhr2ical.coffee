module.exports = (input)->
  GetAllStreetNames: ->
    parser = require "../src/parser"
    p = parser input
    p.then (events) ->
      output = []
      for event in events
        output.push event.street
      output.filter (item, i, ar)->ar.indexOf(item) == i

  GetAllEventsFor: (street, number, timeOffsetInHours = 0) ->
    parser = require "../src/parser"
    Writer = require "../src/writer"
    writer = Writer()
    p = parser input
    p.then (events) ->
      output = []
      for event in events when event.street == street and event.numberFrom <= number and event.numberTo >= number
        output.push event
      writer.setTimeOffset timeOffsetInHours
      writer.createICalForEvents output
      writer.toString()
