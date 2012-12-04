### coffee
layout: 'default'
title: 'Search Results'
dynamic: true
###

if @req.query.query
	query = @req.query.query

	h2 "Searching for #{query}"

	ul ->
		for document in @getCollection('documents').findAll({title:$like:query}).toJSON()
			li 'typeof': 'sioc:Page', about: document.url, class: ('active'  if @document.url is document.url), ->
				a href: document.url, property: 'dc:title', ->
					text document.title

else
	h2 "No query provided"