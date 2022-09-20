var express = require('express');
var app = express();
var bodyParser=require('body-parser');
var path=require('path');
var Validator = require('Validator');
const con=require('./Config/database');
const { Console } = require('console');

app.use(express.static('public'));
app.use(express.urlencoded({ extended : true }));
 
/*  app.get('/', function (req, res) {
    res.render( __dirname+"/Form.ejs" );
 })
 */

 //middelware day 3 in node js concept

 /* app.use(function(req,res,next){
  console.log(req);
  req.custome_time = Date.now()
  next();
 }) */

var server = app.listen(8081, function () {
  var host = server.address().address
  var port = server.address().port

  console.log("Example app listening at http://%s:%s", host, port)
})


app.get('/', function (req, res) {
  console.log(req)
  con.query("SELECT * FROM tbl_user_data", function (err, result) {
    if (err) throw err;
    console.log(result);
    res.render(path.join(__dirname + "/" + "post_form.ejs"),{data:result} );


  });

  
})


app.post('/update/:id', function(req, res){
  console.log(req.body)

  const rules = {
    first_name: 'required',
    last_name: 'required', // Can be a piped string
    email: 'required|email',
    phone: 'required'
  };

  const v = Validator.make(req.body, rules);

  if (v.fails()){
      const errors = v.getErrors();
      console.log(errors);
      res.render(path.join(__dirname+'/post_form.ejs'), { errors: errors })
  }else {
    var id = req.params.id;
    var updatedata = req.body;
    sql = `UPDATE tbl_user_data SET ? where id=${id}`;
    con.query(sql,updatedata,function(err,result,fields){
      if(err) throw err;
     res.redirect('/');
    })
  }
})
  // UPDATE Data 
  app.get('/edit/:id', (req, res) =>{
    var id = req.params.id;
    sql = `select * from tbl_user_data where id=${id}`;
    con.query(sql, (err, result) =>{
        if(!err){
            console.log(result)
            res.render(path.join(__dirname+'/post_form1.ejs'), {data: result})
        }
    })
})

//Delete


app.get('/delete-user/:id', (req, res) =>{
  console.log("hi");
  con.query("DELETE FROM tbl_user_data WHERE id = ?", [req.params.id], (err, rows, fields)=>{
      if(!err){
          console.log("Successfully Deleted!")
          res.redirect("/");
      }
      else{
          console.log(err);
      }
  })
});










// Post Method
app.post('/process_post', function(req, res){
  console.log(req.body)

  const rules = {
    first_name: 'required',
    last_name: 'required', // Can be a piped string
    email: 'required|email',
      phone: 'required|integer'
  };

  const v = Validator.make(req.body, rules);

  if (v.fails()){
      const errors = v.getErrors();
      console.log(errors);
      res.render(path.join(__dirname+'/post_form.ejs'), { errors: errors })
  }else {
    con.query("INSERT INTO tbl_user_data SET ?",req.body,function(err,result,fields){
      if(err) throw err;
      console.log(result);
     // res.send('Hello '+req.body.first_name+ ' ' + req.body.last_name+ ''+ req.body.email+ ''+ req.body.phone+ '')
     //res.render(path.join(__dirname+'/post_form.ejs'),{ data : result,errors : errors }) 
     res.redirect('/');



    })
  }
})

 
/* //error Handler Day 3 in node js
app.use(function(req,res,next){
  res.render(path.join(__dirname + "/" + "error.ejs") );
  var err = new Error('Not found');
  err.status = 404;
  next();


}) */
