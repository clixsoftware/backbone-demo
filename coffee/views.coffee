###
# MEMBERS LIST
###############
App.View.Member.list = Backbone.View.extend
	tagName: 'tbody'
	
	initialize: ->
		@collection.on 'reset', this.render, this
		@collection.on 'add', (member) ->
			if !@options.filter || @options.filter.search(member.get('type')) isnt -1
				@$el.append new App.View.Member.listItem(model:member).render().el
		, this

		template = Handlebars.templates['members']
		filter   = {}
		switch @options.filter
			when 'patients' then filter.patient = true
			when 'nurses'   then filter.nurse   = true
			when 'doctors'  then filter.doctor  = true
			else filter.all = true

		$('[data-template="members"] > div').html template filter:filter
		$('[data-list="members"]').append @render().el

	render: ->
		_.each @collection.models, (member) ->
			@$el.append new App.View.Member.listItem(model:member).render().el
		, this
		this

###
# MEMBER LIST ITEM
###################
App.View.Member.listItem = Backbone.View.extend
	tagName: 'tr'

	initialize: ->
		@model.on 'change', @render, this
		@model.on 'destroy remove', @close, this

	render: (eventName) ->
		template = Handlebars.templates['member']
		@$el.html template member:@model.attributes
		this

	close: ->
		$(@el).unbind()
		$(@el).remove()

###
# MEMBER VIEW / DETAILS
########################
App.View.Member.view = Backbone.View.extend
	tagName:   'div'
	className: 'well member'
	
	initialize: ->
		@model.on 'change', this.render, this
		App.View.Member.crudLoadView 'read', this

	render: (eventName) ->
		self     = this
		template = Handlebars.templates['member-view']
		@$el.html template member:self.model.attributes
		this

###
# UPDATE
#########
App.View.Member.update = Backbone.View.extend
	tagName:   'div'
	className: 'well member'
	
	initialize: ->
		@model.on 'change', this.render, this
		App.View.Member.crudLoadView 'update', this

	render: (eventName) ->
		self     = this
		template = Handlebars.templates['member-update']
		@$el.html template member:self.model.attributes
		this

	events:
		'submit form' : 'save'

	save: (e) ->
		self = this
		info = @$el.find('form').serializeObject()

		@model.save(
			info
			wait: true
			error: (model, response) ->
				App.View.Member.createErrorMsgs(response, self)
			success: (model, response) ->
				if App.Members
					existingModel = App.Members.get self.model.id
					existingModel.set info if existingModel and (existingModel.cid isnt self.model.cid)

				Router.navigate "/members/#{self.model.id}", trigger:true
				App.View.Member.crudLoadAlert type:'success', message:'Save was all good!'
		)

###
# DELETE
#########
App.View.Member.delete = Backbone.View.extend
	tagName:   'div'
	className: 'well member'

	initialize: ->
		App.View.Member.crudLoadView 'delete', this

	render: (eventName) ->
		self = this
		template = Handlebars.templates['member-delete']
		@$el.html template member:self.model.attributes
		this

	events:
		'submit form' : 'save'

	save: (e) ->
		self = this
		@model.destroy(
			wait: true
			error: (model, response) ->
				console.log response
			success: (model, response) ->
				if App.Members
					existingModel = App.Members.get self.model.id
					App.Members.remove existingModel if existingModel and (existingModel.cid isnt self.model.cid)
				
				Router.navigate '/members/create', trigger:true
				App.View.Member.crudLoadAlert type:'success', message:'He gone!'
		)

###
# CREATE
#########
App.View.Member.create = Backbone.View.extend
	tagName:   'div'
	className: 'well member'

	initialize: ->
		App.View.Member.crudLoadView 'create', this

	render: (eventName) ->
		template = Handlebars.templates['member-create']
		@$el.html template
		this

	events:
		'submit form' : 'save'

	save: (e) ->
		self   = this
		info   = @$el.find('form').serializeObject()
		member = new App.Model.Member

		member.save(
			info
			wait: true
			error: (model, response) ->
				App.View.Member.createErrorMsgs(response, self)
				
			success: (model, response) ->
				if App.Members
					App.Members.add member
				
				Router.navigate "/members/#{response.id}", trigger:true
				App.View.Member.crudLoadAlert type:'success', message:'Sweet! Member created!'
		)

###
# HELPER METHOD FOR THE CRUD VIEWS
###################################
App.View.Member.crudLoadView = (action, self = this) ->
	$target      = $('[data-template="member-crud"] > div')
	template     = Handlebars.templates['member-nav']
	crud         = {}
	crud[action] = true
	if self.model
		crud.id = self.model.id

	$target.html template crud:crud
	$target.append self.render().el


App.View.Member.crudLoadAlert = (o, template = 'member-crud', self = this) ->
	alertTemplate = Handlebars.templates['alert']
	$('[data-template="'+template+'"]').prepend(alertTemplate
			type:o.type
			message:o.message
		).find('[data-alert]').fadeIn('slow').delay(2500).fadeOut('slow', -> $(this).remove())


App.View.Member.createErrorMsgs = (errors, self) ->
	self.$el.find('.control-group').removeClass('error').find('[class*="help"]').html('')
	for own key, msgs of errors
		cnt  = 1
		tot  = msgs.length
		eMsg = ''
		for msg in msgs
			divider = if tot isnt cnt then ', ' else ''
			eMsg += msg + divider
			cnt++
		self.$el.find('[name="'+key+'"]').parents('.control-group:eq(0)').addClass('error').find('[class*="help"]').html(eMsg)