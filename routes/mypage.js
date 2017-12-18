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
  console.log("Connect MYPAGE");
  next();
});

router.get('/', (req,res)=>{

  if(req.session.uname!=null){
    let uid = req.session.uid;

    let sql = 'SELECT appoint.apid as apid, shops.sid as sid, apupoint, apapoint, aprprice, apdate, sname, sdname, sphairname, spdprice '+
                'FROM appoint, shops, sdesiner, sprice, user '+
                'WHERE appoint.sid = shops.sid '+
                'AND appoint.sdid = sdesiner.sdid '+
                'AND appoint.spid = sprice.spid '+
                'AND appoint.uid = user.uid ' +
                'AND appoint.uid = '+uid +
                ' ORDER BY apdate DESC';

    client.query(sql, (err, rlist)=>{
      if(err){
        res.status(500).send("DB ERROR : "+ err);
      }else{
        fs.readFile('views/mypage.ejs', 'utf8', (err, data)=>{
          if(err){
            res.status(404).send("No Found File...");
          }else{
            res.status(200).send(ejs.render(data, {
              rlist:rlist,
              upoint:req.session.upoint
            }));
          }
        });
          
      }
    });

   
  }else{
    res.status(300).redirect("/login");
  }

});

router.post('/out', (req, res)=>{
  let why = req.body.out;
  let uid = req.session.uid;

  client.query("update user set isUse="+ 1 +", utwhy="+ why +" where uid = "+uid, (err, uinfo)=>{
    if(err){
      res.status(500).send("ERROR OUT : " + err);
    }else{
      req.session.uuid = null;
      req.session.uname = null;
      req.session.uid = null;
      req.session.upoint = null;
      res.status(200).redirect("/");
    }
  });
});

router.post("/appoint/cancle", (req, res)=>{
  let apid = req.query.apid;
  let aupoint = req.query.aupoint;
  client.query("DELETE FROM appoint WHERE apid = "+ apid, (err)=>{
    if(err){
      res.status(500).send("appoint DELETE ERR : " + err);
    }else{
      req.session.upoint += parseInt(aupoint);
      client.query("UPDATE user set upoint="+req.session.upoint+" where uid = "+req.session.uid, (err)=>{
        if(err){
          res.status(500).send("ERROR OUT : " + err);
        }else{
          res.status(200).redirect("/mypage");
        }
      });
    }
  });
});

module.exports = router;