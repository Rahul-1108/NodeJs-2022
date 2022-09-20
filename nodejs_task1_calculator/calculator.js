
//Create Calculator using switch case in nodejs


var http = require('http');

http.createServer(function (req, res) {
     a= 10,
     b=5;
    function cal(a,b,op){
        switch(op){
            case '+':
                return a + b
                console.log(add);
                break;
            case '-':
                return a - b
                console.log(sub);
                break;
            case '*':
            return a * b
            console.log(multi);
                break;

             case '/':
                return a / b
                    console.log(multi);
                        break;
            default:
            return 0;
        }
    }
    console.log(cal(a,b,'+'))
  console.log(cal(a,b,'-'))
  console.log(cal(a,b,'*'))
  console.log(cal(a,b,'/'))

}).listen(1024);