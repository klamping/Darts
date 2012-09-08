chai = require 'chai'
should = chai.should()

Backbone = require 'backbone'
{Kit} = require '../src/Kit'
{Round} = require '../src/Round'
{Game} = require '../src/Game'
{Match} = require '../src/Match'
{Player} = require '../src/Player'

describe '#Match', ->
	before ->
		@p1 = new Player
			id: 1,
			name: 'Kevin'
		@p2 = new Player
			id: 2,
			name: 'Paul'

		g1Rounds = [
			[0, 1, 2, 3, 4, 5, 6],
			[0, 1, 2, 3, 4, 5, 6],
			[0, 1, 2, 3, 4, 5, 6]
		]
		g2Rounds = [
			[1, 1, 1, 1, 1, 0, 0],
			[1, 1, 1, 1, 1, 0, 0],
			[1, 1, 1, 1, 1]
		]
			
		@g1 = new Game
			rounds: g1Rounds,
			player: @p1,
			mId: 1
		@g2 = new Game
			rounds: g2Rounds
			player: @p2,
			mId: 1
		@m1 = new Match
			g1: @g1,
			g2: @g2,
			id: 1
	it 'should have a match id', ->
		@m1.id.should.equal 1
	it 'should have a winner', ->
		@m1.get('leaderBoard')[0].id.should.equal 1
	it 'should have a loser', ->
		@m1.get('leaderBoard')[1].id.should.equal 2
	it 'should update the leaderboad when the score of a game changes', ->
		game = @m1.games.at('1')
		game.rounds.at('0').kits.at('6').set('hits', 9)
		game.rounds.at('1').kits.at('6').set('hits', 9)
		game.rounds.at('2').kits.at('4').set('hits', 9)
		game.rounds.at('0').kits.at('5').set('hits', 9)
		game.rounds.at('1').kits.at('5').set('hits', 9)
		game.rounds.at('2').kits.at('3').set('hits', 9)
		game.rounds.at('0').kits.at('3').set('hits', 9)
		@m1.games.sort()
		@m1.get('leaderBoard')[0].id.should.equal 2
		@m1.get('leaderBoard')[1].id.should.equal 1