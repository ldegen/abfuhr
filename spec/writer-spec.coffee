describe "The writer", ->
  it "writes out single Events", ->
    Writer = require "../src/writer"
    writer = Writer()
    writer.createICalForSingleEvent
      date: new Date
      street: "Ramelshovener Strasse"
      type: "dicke trulla - einmal jährlich"

    expect(writer.events).to.have.length(1)
    expect(writer.toString()).match /Ramelshoven/

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
    writer.createICalForEvents events
    cal = writer.toString()
    expect(cal).match /Ramelshoven/
    expect(cal).match /Lothar/
    expect(cal).match /grueneTonne/

  it "shifts event dates by the specified time offset", ->
    Writer = require "../src/writer"
    writer = Writer()
    writer.setTimeOffset 4
    myDate = new Date
    writer.createICalForSingleEvent
      date: myDate
      street: "Ramelshovener Strasse"
      type: "dicke trulla - einmal jährlich"

    expect(writer.events).to.have.length(1)
    expect(myDate - writer.events[0].start()).to.equal(4*60*60*1000)
