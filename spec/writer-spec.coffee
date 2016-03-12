describe "The writer", ->
  it "writes", ->
    Writer = require "../src/writer"
    writer = Writer()
    cal = writer.createICal
      date: new Date
      street: "Ramelshovener Strasse"
      type: "dicke trulla - einmal jährlich"
    console.log cal
    expect(cal).match /Ramelshoven/
      
