Backbone = require 'backbone'

class Player extends Backbone.Model
	initialize: () ->
		@set('record', [0, 0])

root = exports ? window 
root.Player = Player