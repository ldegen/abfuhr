describe "The writer", ->
  it "writes out single Events", ->
    Writer = require "../src/writer"
    writer = Writer()
    cal = writer.createICalForSingleEvent
      date: new Date
      street: "Ramelshovener Strasse"
      type: "dicke trulla - einmal jährlich"
    expect(cal).match /Ramelshoven/
      
  it "writes out multiple Events", ->
    Writer = require "../src/writer"
    writer = Writer()
    events = [
      {date: new Date
      street: "Ramelshovener Strasse"
      type: "dicke trulla - einmal jährlich"},
      {date: new Date
      street: "Lothar Strasse"
      type: "grueneTonne - einmal jährlich"}];
    cal = writer.createICalForEvents events
    console.log(cal)
    expect(cal).match /Ramelshoven/
    expect(cal).match /Lothar/
    expect(cal).match /grueneTonne/
