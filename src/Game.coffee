Backbone = require 'backbone'

{Kit} = require '../src/Kit'
{Round} = require '../src/Round'

class RoundList extends Backbone.Collection
    model: Round

class Game extends Backbone.Model
	initialize: () ->
		@numRounds = 0
		@rounds = new RoundList
		for round in @get 'rounds'
			@rounds.add	new Round 
				kits: round, 	
				round: @numRounds
		@rounds.on('change', ->
			@set 'score', @getScore()
		, @)
		@set 'score', @getScore()
		@set 'finished', @isGameFinished()
	getScore: ->
		total = 0
		@rounds.each (round) ->
			total += round.get('score')
		total
	isGameFinished: ->
		unfinished = @rounds.find (round) ->
			round.kits.length < 7
		if unfinished
			return false
		true
			


root = exports ? window 
root.Game = Game