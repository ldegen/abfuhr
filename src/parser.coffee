module.exports = (input)->
  Promise = require "promise"
  new Promise (resolve,reject)->
    output = []
    for record in input.result.records
      for key, value of record when (/^TERMIN(\d+)$/.exec key) and value
          output.push 
            date: new Date()
            street: record.STRASSE1
            type: "#{record.PLAN_BEZ} - #{record.AUFGTURNUS}"
    resolve output

