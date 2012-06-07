###
# HOME PAGE
######################
App.View.Home = Backbone.View.extend
	tagName:   'div'
	className: 'home'
	
	initialize: ->
		$('[data-template="home"] > div').html @render().el

	render: (eventName) ->
		template = Handlebars.templates['home']
		@$el.html template()
		this