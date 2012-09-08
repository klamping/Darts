root = exports ? this

if (!Meteor?)
    Backbone = require 'backbone'

class Player extends Backbone.Model
	initialize: () ->
		@set('record', [0, 0])

root.Player = Player