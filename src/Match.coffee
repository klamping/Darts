Backbone = require 'backbone'

{Game} = require '../src/Game'

class GameList extends Backbone.Collection
    model: Game,
    comparator: (game) ->
        -1 * game.get('score')

class Match extends Backbone.Model
	initialize: () ->
		@games = new GameList
		@games.on('all', ->
			@updateLeaderboard()
		, @)
		@games.add @get('g1')
		@games.add @get('g2')
	updateLeaderboard: ->
		@set 'leaderBoard', @games.pluck('player')
		###
		if (@get('g1').get('finished') && @get('g2').get('finished'))
			console.log @get('leaderBoard')[0]
			record = @get('g1').get('player').get('record')###

root = exports ? window 
root.Match = Match