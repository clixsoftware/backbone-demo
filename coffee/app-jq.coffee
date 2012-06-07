# PLUGINS
$.fn.serializeObject = ->
	o = {}
	a = @serializeArray()
	$.each a, ->
		if o[@name]
			o[@name] = [ o[@name] ]  unless o[@name].push
			o[@name].push @value or ""
		else
			o[@name] = @value or ""
	o
	
# EVENTS AND ONLOAD
$ ->
	$(document).on 'submit', 'form', (e) ->
		e.preventDefault()

	$(document).on 'click', '.subnav .disabled', (e) ->
		e.preventDefault()

	# FOR LOADING PAGES
	$(document).on 'click', '[data-nav="main"] a', (e, onload=false) ->
		$a          = $(this)
		$wrap       = $a.parents('[data-nav="main"]:eq(0)')
		page        = $a.attr 'data-load-page'
		$activePage = $('[data-page]:visible')
		$loadPage   = $('[data-page="'+page+'"]')

		$wrap.find('.active').removeClass 'active'
		$a.parents('li:eq(0)').addClass 'active'

		if onload
			$loadPage.show()
		else
			if $activePage.length and $activePage.data('page') isnt $loadPage.data('page')
				$activePage.fadeOut 'fast', ->
					$loadPage.fadeIn 'fast'
			else
				$loadPage.fadeIn 'fast'


	# SET MAIN NAV MARKER AND LOAD THE RIGHT PAGE
	(->
		loadPage = (page='home') ->
			$('[data-nav="main"] [data-load-page="'+page+'"]').trigger 'click', [true]

		page = if location.hash.search('member') isnt -1 then 'members' else 'home'
		loadPage(page)
	)()

	