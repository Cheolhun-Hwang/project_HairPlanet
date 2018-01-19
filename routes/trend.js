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
  console.log("Connect TREND");
  next();
});

router.get('/', (req,res)=>{
  let isLogin = false;
    client.query("SELECT ttitle, tcontext, timage FROM trend WHERE ttype like 'W'", (err, wresults)=>{
      if(err){
        res.status(500).send("No data.. ");
      }else{
        client.query("SELECT ttitle, tcontext, timage FROM trend WHERE ttype like 'M'", (err, mresults)=>{
          if(err){
            res.status(500).send("No data.. ");
          }else{
            if(req.session.uname!=null){
              isLogin = true;
            }else{
              isLogin = false;
            }
            fs.readFile('views/trend.ejs', 'utf8', (err, data)=>{
              if(err){
                res.status(404).send("No Found File...");
              }else{
                res.status(200).send(ejs.render(data, {
                  manslist:mresults,
                  womanslist:wresults,
                  isLogin:isLogin
                }));
              }
            });
          }
        });
      }
    });
    
    
  
});

module.exports = router;