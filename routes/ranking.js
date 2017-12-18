var express = require('express');
var router = express.Router();
var fs = require('fs');
var ejs = require('ejs');
const mysql = require('mysql');
const client = mysql.createConnection({
  host:'localhost',
  port:3306,
  user:'hooney',
  password:'hch',
  database:'hairplanet'
});

/* GET home page. */
router.use(function(req, res, next) {
  console.log("Connect RANKING");
  next();
});

router.get('/', (req,res)=>{
  let isLogin = false;

  client.query("SELECT shops.sid, sname, rsalse, sddr, sphoto1 FROM ranking, shops WHERE ranking.sid = shops.sid", (err, rlist)=>{
    if(err){
      res.status(500).send("No data");
    }else{
      if(req.session.uname!=null){
        isLogin = true;
      }else{
        isLogin = false;
      }
      fs.readFile('views/ranking.ejs', 'utf8', (err, data)=>{
        if(err){
          res.status(404).send("No Found File...");
        }else{
          res.status(200).send(ejs.render(data, {
            rlist:rlist,
            isLogin:isLogin
          }));
        }
      });
    }
  });

  
  
});

module.exports = router;