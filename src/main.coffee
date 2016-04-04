console.log 'Accessing open data server...'

street = "Lotharstr.";
number = 2
request = require("request")
url = "http://opendata.bonn.de/api/action/datastore/search.json?" +
      "resource_id=1d5ba83d-6a2e-4ebd-9392-9028777ef33c&" +
      "filters[STRASSE1]=" + street

abfuhr2ical = require "../src/abfuhr2ical"
fs = require 'fs'

request({
    url: url,
    json: true
    },
    (error, response, body) ->
      if not error and response.statusCode == 200
        a = abfuhr2ical body
        p = a.GetAllEventsFor(street, 2, 4)
        p.then (events) -> fs.writeFile 'output.ical', events, (err) -> console.log(err)

)
