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
  console.log("Connect SEARCH");
  next();
});

router.get('/', (req,res)=>{
  console.log("search get");
  let isLogin = false;
  if(req.session.uname!=null){
    isLogin = true;
  }else{
    isLogin = false;
  }
  fs.readFile('views/search.ejs', 'utf8', (err, data)=>{
    if(err){
      res.status(404).send("No Found File...");
    }else{
      res.status(200).send(ejs.render(data, {
        isLogin:isLogin,
        rlist:null
      }));
    }
  });
  
});

router.post('/', (req,res)=>{
  console.log("search post");
  let isLogin = false; 
  if(req.session.uname!=null){
    isLogin = true;
  }else{
    isLogin = false;
  }
  let spot = req.body.spot;
  let keys = req.body.keyword;
  let stext = req.body.searchtext;

    console.log("spot : " + spot + " / keys : " + keys+ " / stext : " + stext);


    client.query("SELECT skey, sphoto1, sname, sddr, sid FROM shops", (err, slist)=>{
      var rlist = new Array();
      for(var sl = 0 ; sl<slist.length;sl++){
        console.log(slist[sl]);
        
        if(slist[sl].sddr.indexOf(spot)!=-1){
          if((keys!=undefined)){
            for(var i = 0; i<keys.length ; i++){
              if(slist[sl].skey.indexOf(keys[i])!=-1){
                if(stext==''){
                  rlist.push(slist[sl]);
                  break;
                }else{
                  if(slist[sl].sname.indexOf(stext)!=-1){
                    rlist.push(slist[sl]);
                    break;
                  }
                }
              }
            }
          }else{
            if(stext==''){
              rlist.push(slist[sl]);
              break;
            }else{
              if(slist[sl].sname.indexOf(stext)!=-1){
                rlist.push(slist[sl]);
                break;
              }
            }
          }
        }
      }
      console.log(rlist);
      fs.readFile('views/search.ejs', 'utf8', (err, data)=>{
        if(err){
          res.status(404).send("No Found File...");
        }else{
          res.status(200).send(ejs.render(data, {
            isLogin:isLogin,
            rlist:rlist
          }));
        }
      });

    });
});

module.exports = router;