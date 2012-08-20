Backbone = require 'backbone'

class Kit extends Backbone.Model
	defaults:
		'hits': 0
	initialize: () ->
		@set 'score', @getScore()
		@on 'change:hits', ->
			@set 'score', @getScore()
	getScore: () ->
		@get('hits') * @get('value')

root = exports ? window 
root.Kit = Kit  