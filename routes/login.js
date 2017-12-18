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
  console.log("Connect LOGIN");
  next();
});

router.use('/logout', (req, res)=>{
  console.log("LOGOUT");
  req.session.uname = null;
  req.session.uuid = null;
  res.status(200).redirect('/');
});

router.get('/', (req,res)=>{
  fs.readFile('public/login.html', 'utf8', (err, data)=>{
    if(err){
      res.status(404).send("No Found File...");
    }else{
      res.status(200).send(data);
    }
  });
});

router.post('/', (req,res)=>{
  let uuid = req.body.uuid;
  let upwd = req.body.upwd;

  client.query("SELECT uid, uuid, upwd, uname, upoint, isUse FROM user", (err, datas)=>{
    console.log(datas);
    if(err){
      res.status(500).send("DATABASE CONNECT ERRER...")
    }else{
      for(var i=0;i<datas.length;i++){
        
        if((uuid==datas[i].uuid) && (upwd==datas[i].upwd)){
          if(datas[i].isUse == 0){
            req.session.uuid = datas[i].uuid;
            req.session.uname = datas[i].uname;
            req.session.uid = datas[i].uid;
            req.session.upoint = datas[i].upoint;
            res.status(200).redirect('/');
          }
        }
      }
      res.send("잘못된 계정 정보입니다.");
    }
  });
});

router.post('/register', (req, res)=>{
    let uname = req.body.uname;
    let uuid = req.body.uuid;
    let upwd = req.body.upwd;
    let repwd = req.body.repwd;
    let uphone = req.body.uphone;

    let nowdate = new Date().toISOString().slice(0,10);;

    client.query('insert into user (uuid, upwd, uname, uphone, ucreate, upoint, isUse) VALUES (?,?,?,?,?,?, ?)', [uuid, upwd, uname, uphone, nowdate, 0, 0], (err)=>{
      if(err){
        res.status(500).send('DATABASE INSERT ERROR : ' + err);
      }else{
        res.status(200).redirect('/login');
      }
    });
});


module.exports = router;