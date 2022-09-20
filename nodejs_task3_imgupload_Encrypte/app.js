var express = require('express');
var app = express();
var bodyParser=require('body-parser');
var path=require('path');
var Validator = require('Validator');
const con=require('./Config/database');
const { Console } = require('console');
const multer  = require('multer');
const { response } = require('express');

require('dotenv').config()

//cryptlib
var cryptLib = require('cryptlib');
console.log(process.env.ENC_KEY)
const shakey = cryptLib.getHashSha256(process.env.ENC_KEY, 32) //32 bytes = 256 bits

//Json
var json_object = {"name":"john","age":30,"city":"New York"};
console.log(json_object)
console.log(JSON.stringify(json_object))

encryptedText = cryptLib.encrypt(JSON.stringify(json_object), shakey, process.env.ENC_IV);
//Encription
console.log(encryptedText)

//Decryption
originalText = cryptLib.decrypt(encryptedText, shakey, process.env.ENC_IV); 
console.log(originalText)
console.log(JSON.parse(originalText))




//console.log(process.env.PORT) // remove this after you've confirmed it working

app.use(express.static('Public'));
app.use(express.urlencoded({ extended : true }));

//===============================================
 
/*  app.get('/', function (req, res) {
    res.render( __dirname+"/Form.ejs" );
 })
 */




 //Image upload
 //======================================================

 var storage = multer.diskStorage({
  destination:function(req,file,cb){
    cb(null,'./Public/uploads')
  },
  filename:function(req,file,cb){
  cb(null,Date.now() +path.extname(file.originalname))
}
 })
var upload = multer({storage:storage})
app.use('/uploads',express.static('uploads'));


 
//File Upload function
//===================================================

app.post('/file_upload', upload.single('file'), function (req, res) {
  console.log(req.file);
  console.log(req.body);




  response = {
      message:' File uploaded successfully',
      filename: req.file.filename

  };


  console.log(response);
  res.end(JSON.stringify(response));


})

//get the form post_form
//=======================================================

app.get('/post_form.ejs',function(req,res){
  res.sendFile(__dirname + "/" + "post_form.ejs");
})


//===========================================================


app.get('/',upload.single('file'), function (req, res) {
  console.log(req)
  con.query("SELECT * FROM tbl_user_data", function (err, result) {
    if (err) throw err;
    console.log(result);
    res.render(path.join(__dirname + "/" + "post_form.ejs"),{data:result} );


  });

  
})



// Post Method
//=======================================================================
app.post('/process_post',upload.single('file'), function(req, res){
  console.log(req.body)
//For Password Encrypte
  var pass = req.body.password
  const shakey = cryptLib.getHashSha256(process.env.ENC_KEY, 32) //32 bytes = 256 bits

  encryptedpassword = cryptLib.encrypt(pass, shakey, process.env.ENC_IV);
//Encription
console.log(encryptedpassword)

//validation
//==================
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
    con.query(`INSERT INTO tbl_user_data (first_name,last_name,email,password,phone,file) VALUES ('${req.body.first_name}', '${req.body.last_name}', '${req.body.email}','${encryptedpassword}' ,'${req.body.phone}','${req.file.filename}')`,req.body,function(err,result,fields){
      if(err) throw err;
      console.log(result);
     // res.send('Hello '+req.body.first_name+ ' ' + req.body.last_name+ ''+ req.body.email+ ''+ req.body.phone+ '')
     //res.render(path.join(__dirname+'/post_form.ejs'),{ data : result,errors : errors }) 
     res.redirect('/');
    })
  }
})


//==========================================================

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
  //===================================================================== 
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
//===========================================================================
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



//=================================================================
 var server = app.listen(3000, function () {
  var host = server.address().address
  var port = server.address().port

  console.log("Example app listening at http://%s:%s", host, port)
})
