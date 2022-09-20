//Delete File using node js

var fs = require('fs');
var filePath = '/home/hlink/Desktop/nodejs_task/myfile.txt'; 
fs.unlinkSync(filePath);