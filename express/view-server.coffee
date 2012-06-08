express = require("express")
app     = express.createServer()

app.use(express.static('../'));

app.listen 3001
console.log "Listening on port 3001! Jiggy!"