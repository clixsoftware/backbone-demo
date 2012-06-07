###
MODELS
###
App.Model.Member = Backbone.Model.extend
	defaults:
		city:'na'
		state:'na'
		country:'na'
		type:'patient'

	url: ->
		base = "#{App.api}members/"
		return if @isNew() then base else base + @id

	validate:
		username:
			required:true
		name:
			required:true