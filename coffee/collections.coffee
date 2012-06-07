###
COLLECTIONS
###
App.Collection.Members = Backbone.Collection.extend
	initialize: (models, options) ->
		@filter = options.filter

	model: App.Model.Member

	url: ->
		q = if @filter then '?filter='+@filter else ''
		App.api+'members'+q