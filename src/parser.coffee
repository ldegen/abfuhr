module.exports = (input)->
  Promise = require "promise"
  new Promise (resolve,reject)->
    output = []
    for record in input.result.records
      for key, value of record when (/^TERMIN(\d+)$/.exec key) and value
          output.push
            date: new Date(value)
            street: record.STRASSE1
            numberFrom: Math.min(record.HNR_GE_AB, record.HNR_UG_AB)
            numberTo: Math.max(record.HNR_GE_BIS, record.HNR_UG_BIS)  
            type: "#{record.PLAN_BEZ} - #{record.AUFGTURNUS}"
    resolve output
