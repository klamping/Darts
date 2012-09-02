if (!Meteor?) 
	Backbone = require 'backbone'
	{Kit} = require '../src/Kit'

class KitList extends Backbone.Collection
    model: Kit

class Round extends Backbone.Model
	defaults:
		values : [15, 16, 17, 18, 19, 20, 25]
	initialize: () ->
		that = @
		@kits = new KitList
		for kit in @get 'kits'
			@addKit @get('values')[@kits.length], kit
		@set 'score', @getScore()
		@kits.on('all', ->
			@set 'score', @getScore()
		, @)
	addKit: (value, hits) ->
		if (@kits.length < @get('values').length)
			kit = new Kit {'id': value, 'hits': hits}
			@kits.add kit
			return kit
		else
			throw new Error 'Too many kits added, cannot add another kit'
	setKitHits: (value, hits) ->
		kit = @kits.get value
		if kit
			kit.set 'hits', hits
		else 
			kit = @addKit value, hits
		@set 'score', @getScore()
	getScore: () ->
		total = 0
		@kits.each (kit) ->
			total += kit.get('score')
		total
	getThrowsLeft: ->
		@get('values').length - @kits.length


if (exports?)
	exports.Round = Round