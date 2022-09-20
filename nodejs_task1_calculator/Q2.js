//Read text file and display in browser


var fs = require('fs');

fs.readFile('myfile.txt', 'utf8', function(err, data) {
    if (err) throw err;
    console.log(data);
});

