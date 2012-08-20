Backbone = require 'backbone'

{Kit} = require '../lib/Kit'

class KitList extends Backbone.Collection
    model: Kit

class Round extends Backbone.Model
	defaults:
		values : [15, 16, 17, 18, 19, 20, 25]
	initialize: () ->
		@kits = new KitList
		@numKits = 0
		for kit in @get 'kits'
			@addKit @get('values')[@numKits], kit
		@set 'score', @getScore()
		@on 'change:kits', ->
			@set 'score', @getScore()
	addKit: (value, hits) ->
		if (@numKits < @get('values').length)
			kit = new Kit {'value': value, 'hits': hits}
			@kits.add kit
			@numKits++
		else
			throw new Error 'Cannot add another kit'

	setKitHits: (value, hits) ->
		console.log @kits.models
	getScore: () ->
		#console.log @kits
		#total = for kit in @get 'kits'
			#console.log kit
			#kit.get('score')
		#console.log total
		#total = total.reduce (a, b) ->
		 #   a + b
		total = 0

root = exports ? window 
root.Round = Round