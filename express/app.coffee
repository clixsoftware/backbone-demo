express = require("express")
app     = express.createServer()
autoId  = 1

app.use express.bodyParser()
app.use express.methodOverride()

# Allow Cross-Domain AJAX
app.all "/*", (req, res, next) ->
	res.header "Access-Control-Allow-Origin", "*"
	res.header "Access-Control-Allow-Headers", "Content-Type, X-Requested-With"
	res.header "Access-Control-Allow-Methods", "POST, GET, PUT, DELETE, OPTIONS"
	next()


# HOME PAGE
app.get "/", (req, res) ->
	res.send "Yo, I'm the super ill server!"


# READ LIST
app.get "/members", (req, res) ->
	filter   = req.query["filter"]
	fMembers = members

	if filter
		fMembers = members.filter((element) ->
			element.type is filter.substring 0, filter.length - 1
		)
	res.json fMembers


# CREATE
app.post "/members", (req, res) ->
	console.log "POST"
	id = members.length
	req.body.id = autoId++
	members.push req.body
	res.json members[id]


# READ ONE
app.get "/members/:id", (req, res) ->
	id = parseInt req.params.id
	members.filter((element) ->	id = members.indexOf element if element.id is id)
	res.json members[id]


# DELETE
app.del "/members/:id", (req, res) ->
	console.log "DELETE"
	id = parseInt req.params.id
	members.filter((element) ->	id = members.indexOf element if element.id is id)
	member = members[id]
	members.splice(id, 1)
	res.json member


# UPDATE
app.put "/members/:id", (req, res) ->
	console.log "PUT"
	id = parseInt req.params.id
	members.filter((element) ->	id = members.indexOf element if element.id is id)
	members[id] = req.body
	res.json members[id]


# TEST DATA
members = [
	id: autoId++
	username: "jyounce"
	name: "Judd Younce"
	city: "Ashland"
	state: "Kentucky"
	country: "United States"
	type: "patient"
,
	id: autoId++
	username: "superman"
	name: "Clark Kent"
	city: "Metropolis"
	state: "Krypton"
	country: "DC Universe"
	type: "patient"
,
	id: autoId++
	username: "batman"
	name: "Bruce Wayne"
	city: "Gotham City"
	state: "Illinois"
	country: "United States"
	type: "patient"
,
	id: autoId++
	username: "iron-man"
	name: "Edward Stark"
	city: "New York"
	state: "New York"
	country: "United States"
	type: "patient"
,
	id: autoId++
	username: "captain-america"
	name: "Steve Rogers"
	city: "New York"
	state: "New York"
	country: "United States"
	type: "patient"
,
	id: autoId++
	username: "gclooney"
	name: "George Clooney"
	city: "Lexington"
	state: "Kentucky"
	country: "United States"
	type: "doctor"
,
	id: autoId++
	username: "thanks"
	name: "Tom Hanks"
	city: "Concord"
	state: "California"
	country: "United States"
	type: "doctor"
,
	id: autoId++
	username: "wferrell"
	name: "Will Ferrell"
	city: "Irvine"
	state: "California"
	country: "United States"
	type: "doctor"
,
	id: autoId++
	username: "gpaltrow"
	name: "Gwyneth Paltrow"
	city: "Los Angeles"
	state: "California"
	country: "United States"
	type: "nurse"
,
	id: autoId++
	username: "kwinslet"
	name: "Kate Winslet"
	city: "England"
	state: "na"
	country: "United Kingdom"
	type: "nurse"
,
	id: autoId++
	username: "cdiaz"
	name: "Cameron Diaz"
	city: "San Diego"
	state: "California"
	country: "United States"
	type: "nurse"
]

app.listen 3000
console.log "Listening on port 3000! Sweet!"