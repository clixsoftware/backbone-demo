###
ROUTES
###
App.Routes =
	'members/create' : 'memberCreate'
	'members/:id/update' : 'memberUpdate'
	'members/:id/delete' : 'memberDelete'
	'members/:id' : 'member'
	'members' : 'members'
	'*actions' : 'default'