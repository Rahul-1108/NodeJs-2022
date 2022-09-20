
/* Install moment npm and print date in following formate
Eg. March 17th 2022, 11:16:55 am
Eg. Weekday name
Eg. Mar 17th 22
Add 3 days in current date
Subtract 3 days in date */



var http = require('http');
var moment = require('moment');



http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end(('\n 1. ')+ moment().format('MMMM Do YYYY, h:mm:ss a') + 
    ('\n 2. ') + (moment().format('dddd'))+
    ('\n 3. ') + (moment().format("MMM Do YY"))+
    ('\n 4. ') + (moment().add(3, 'days').calendar())+
    ('\n 5. ') + (moment().subtract(3, 'days').calendar()));
  }).listen(8231);

  