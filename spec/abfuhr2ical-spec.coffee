describe "The Abfuhr2Ical", ->
  input = require './data/data.json'
  abfuhr2ical = require "../src/abfuhr2ical"
  a = abfuhr2ical input 
  it "list all available streetnames", ->
    p = a.GetAllStreetNames()
    expect(p).to.be.fulfilled.then (streets)->
      expect(streets).not.empty
      expect(streets).to.include('Aennchenplatz')

  it "gives all events for a valid street", ->
    p = a.GetAllEventsFor('Am Lenkert')
    expect(p).to.be.fulfilled.then (ical)->
      expect(ical).not.empty
      expect(ical).to.be.a "string"
      expect(ical).match /Restm/