Backbone = require 'backbone'

class Kit extends Backbone.Model
	initialize: () ->
		@set 'score', @get('hits') * @get('value')
		@on 'change:hits', ->
			@set 'score', @get('hits') * @get('value')

root = exports ? window 
root.Kit = Kit  