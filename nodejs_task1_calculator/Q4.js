
//Write into file using node js


const fs = require('fs');

const content = 'Rahul Meena!';

fs.writeFile('/home/hlink/Desktop/nodejs_task/myfile.txt', content, err => {
  if (err) {
    console.error(err);
  }
  // file written successfully
});
