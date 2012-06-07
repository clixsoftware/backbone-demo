###
ROUTER / CONTROLLER
###
App.Router = Backbone.Router.extend
	routes: App.Routes # see routes.js
	
	# MEMBERS
	members: (params={}) ->
		filter      = params.filter if params.filter
		App.Members = new App.Collection.Members [], filter:filter
		
		App.Members.fetch
			success: (model, response) ->
				@membersView = new App.View.Member.list collection:App.Members, filter:filter
		
		@memberCreate() if !App.MemberView

		
	# MEMBER
	member: (id=1) ->
		self = this

		# if model exists then use it else, go get it.
		if App.Members and App.Members.get id
			App.MemberView = new App.View.Member.view model:App.Members.get(id)
		else
			member = new App.Model.Member id:id
			member.fetch
				success: (model, response) ->
					App.MemberView = new App.View.Member.view model:member


	# MEMBER UPDATE/PUT
	memberUpdate: (id) ->
		self = this

		# if model exists then use it else, go get it.
		if App.Members and App.Members.get id
			App.MemberView = new App.View.Member.update model:App.Members.get(id)
		else
			member = new App.Model.Member id:id
			member.fetch
				success: (model, response) ->
					App.MemberView = new App.View.Member.update model:member


	# MEMBER DELETE
	memberDelete: (id) ->
		self = this

		# if model exists then use it else, go get it.
		if App.Members and App.Members.get id
			App.MemberView = new App.View.Member.delete model:App.Members.get(id)
		else
			member = new App.Model.Member id:id
			member.fetch
				success: (model, response) ->
					App.MemberView = new App.View.Member.delete model:member


	# MEMBER UPDATE/POST
	memberCreate: ->
		App.MemberView = new App.View.Member.create
		
		
	# DEFAULT
	'default': (actions) ->
		App.HomeView = new App.View.Home

  