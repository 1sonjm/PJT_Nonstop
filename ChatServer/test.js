var express = require('express')
	, cookies = require('cookie')
	, parsed = require('utils')
	, connect = require("connect");

var sessionKey = 'connect.sid';
var sessionStore = new connect.middleware.session.MemoryStore();
var app = express();
var secreatKey = '123456789456';

app.use(express.cookieParser(secreatKey));

app.use(express.json());
app.use(express.urlencoded());

app.use(express.session({ store: sessionStore, key: sessionKey }));