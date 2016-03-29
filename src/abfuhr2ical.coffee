module.exports = (input)->
  GetAllStreetNames: -> 
    parser = require "../src/parser"
    p = parser input
    p.then (events) ->
      output = []
      for event in events
        output.push event.street  
      output.filter (item, i, ar)->ar.indexOf(item) == i 
 
  GetAllEventsFor: (street) -> 
    parser = require "../src/parser"
    Writer = require "../src/writer"
    writer = Writer()
    p = parser input
    p.then (events) ->
      output = []
      for event in events when event.street == street
        output.push event 
      writer.createICalForEvents output