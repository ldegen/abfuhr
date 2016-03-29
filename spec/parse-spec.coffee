describe "The parser", ->
  parser = require "../src/parser"
  it "parses the input. yay.", ->
    input = require './data/data.json'

    p = parser input
    expect(p).to.be.fulfilled.then (events)->
      expect(events).not.empty
      expect(events[0].date).to.be.instanceOf Date
      expect(events[0].street).to.be.a "string"
      expect(events[0].street).not.empty
      expect(events[0].type).to.be.a "string"
      expect(events[0].type).not.empty
  
  it "ignores empty TERMIN###-strings", ->
    input = require './data/data.json'

    p = parser input
    expect(p).to.be.fulfilled.then (events)->
      expect(events.filter((ev)->not ev.date?)).to.be.empty

  it "reads in valid streets", ->
    input = require './data/data.json'

    p = parser input
    expect(p).to.be.fulfilled.then (events)->
      expect(events).not.empty
      expect(events[0].street).to.equal "Aennchenplatz"
      expect(events[0].street).not.empty
