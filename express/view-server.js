// Generated by CoffeeScript 1.3.3
(function() {
  var app, express;

  express = require("express");

  app = express.createServer();

  app.use(express["static"]('../'));

  app.listen(3001);

  console.log("Listening on port 3001! Jiggy!");

}).call(this);
