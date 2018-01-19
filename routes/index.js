var express = require('express');
var router = express.Router();
var fs = require('fs');
var ejs = require('ejs');
const mysql = require('mysql');
const client = mysql.createConnection({
  host:'localhost',
  port:3306,
  user:'root',
  password:'',
  database:'hairplanet'
});


/* GET home page. */
router.use(function(req, res, next) {
  console.log("Connect INDEX");
  next();
});

router.get('/', (req,res)=>{
  let isLogin = false;
  client.query("SELECT user.uname, user.uuid, qa.qacontext FROM qa, user WHERE qa.uid = user.uid", (err, qlist)=>{
    client.query("SELECT bhairname, bhairimage, bdrama, bactor, sid FROM best", (err, blist)=>{
      if(req.session.uname!=null){
        isLogin = true;
      }else{
        isLogin = false;
      }
      fs.readFile('views/index.ejs', 'utf8', (err, data)=>{
        if(err){
          res.status(404).send("No Found File...");
        }else{
          res.status(200).send(ejs.render(data, {
            qalist:qlist,
            dbestlist:blist,
            isLogin:isLogin
          }));
        }
      });
    });
  });
});

router.post('/contact', (req, res)=>{
  let name = req.body.name;
  let email = req.body.email;
  let comments = req.body.comments;

  console.log("name : " + name + " / email : " + email + " / comments" + comments);

  client.query("INSERT INTO contactus (ctname, ctemail, ctcontext) values (?, ?, ?)", [name, email, comments], (err)=>{
    if(err){
      res.status(500).send("DB CONTACT ERROR : " + err);
    }else{
      res.status(200).redirect("/");
    }
  });
});

module.exports = router;
