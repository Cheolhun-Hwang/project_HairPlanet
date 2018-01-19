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
  console.log("Connect INFO");
  next();
});

router.get('/', (req,res)=>{
  let isLogin = false;
  let sid = req.query.sid;

  if(req.session.uname!=null){
    isLogin = true;
  }else{
    isLogin = false;
  }
  let sql1 = "SELECT sid, sname, skey, sddr, sgpsx, sgpsy, sphone, srepre, "+
                    "sopen, srest, spaking, sinfo, sphoto1, sphoto2, sphoto3 "+
               "FROM shops "+
              "WHERE sid = "+ sid;
  let sql2 = "SELECT spid, sptype, sphairname, spbprice, spdprice "+
               "FROM sprice "+
              "WHERE sid = "+ sid;
  let sql3 = "SELECT apdate, sdname "+
               "from shops, sdesiner, appoint "+
              "WHERE shops.sid = sdesiner.sid "+
                "AND appoint.sdid = sdesiner.sdid " + 
                "AND shops.sid = "+sid;
  let sql4 = "SELECT sdid, sdname "+
               "FROM sdesiner "+
              "WHERE sid="+sid;
  let sql5 = "SELECT sbhairname, sbhairimage "+
               "FROM sbest "+
              "WHERE sid="+sid;
  
  client.query(sql1, (err, sinfo)=>{
    if(err){
      res.status(500).send("INFO DB ERROR : " + err);
    }else{
      client.query(sql2, (err, spinfo)=>{
        if(err){
          res.status(500).send("INFO DB ERROR : " + err);
        }else{
          client.query(sql3, (err, sdinfo)=>{
            if(err){
              res.status(500).send("INFO DB ERROR : " + err);
            }else{
              client.query(sql4, (err, dinfo)=>{
                if(err){
                  res.status(500).send("INFO DB ERROR : " + err);
                }else{
                  client.query(sql5, (err, blist)=>{
                    if(err){
                      res.status(500).send("INFO DB ERROR : " + err);
                    }else{
                     
                      fs.readFile('views/info.ejs', 'utf8', (err, data)=>{
                        if(err){
                          res.status(404).send("No Found File...");
                        }else{
                          res.status(200).send(ejs.render(data, {
                            isLogin:isLogin,
                            sinfo:sinfo,
                            spinfo:spinfo,
                            sdinfo:sdinfo,
                            dinfo:dinfo,
                            blist:blist,
                            upoint:req.session.upoint
                          }));
                        }
                      });
    
                    }
                  });
                }
              });
            }
          });
        }
      });
    }
  });
});

router.post('/appoint', (req, res)=>{
  let uid = req.session.uid;
  let sid = req.query.sid; 
  let sdid = req.body.sdid;
  let spid = req.body.spid;
  let point = req.body.point;
  let time = req.body.time;
  let date = req.body.date;
  let price = req.query.price;

  if(point == ''){
    point = 0;
  }


  console.log(uid +" / "+sid+" / " + sdid + " / " + spid + " / " + point + " / " + date + " " + time);



  let sql = "INSERT INTO appoint (uid, sid, sdid, spid, apdate, apupoint, apapoint, aprprice) "+
            " values (1, 2, 34, 9,'2017-12-16 16:00', 300, 270, 27000)";
  
  client.query("INSERT INTO appoint (uid, sid, sdid, spid, apdate, apupoint, apapoint, aprprice) "+
              "values (? ,? ,? ,? ,? ,? ,?, ?)", [uid, sid, sdid, spid, (date+" "+time+":00"), parseInt(point), (parseInt(price)*0.01), (parseInt(price)-parseInt(point))], (err)=>{
                if(err){
                  res.status(500).send("appoint ERROR : "+ err);
                }else{
                  client.query('update user set upoint=' + (parseInt(price)*0.01) + ' where uid = '+uid, (err)=>{
                    if(err){
                      res.status(500).send("update point user ERROR : "+ err);
                    }else{
                      req.session.upoint -= parseInt(point);
                      res.status(200).redirect("/mypage");
                    }
                  });
                }
              });

});

module.exports = router;