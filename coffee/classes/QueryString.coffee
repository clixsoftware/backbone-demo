class QueryString
	constructor: (@qString = null) ->
		@qString = if @qString then @qString else window.location.hash.substring(1)
		@qString = if @qString.split("?")[1] then @qString.split("?")[1] else ''

	getVal: (key, def = '') ->
		vars = @qString.split("&")
		i    = 0

		while i < vars.length
			pair = vars[i].split("=")
			return unescape pair[1] if pair[0] is key
			i++

		return def