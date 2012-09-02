chai = require 'chai'
should = chai.should()

{Kit} = require '../src/Kit'
{Round} = require '../src/Round'
{Game} = require '../src/Game'
{Player} = require '../src/Player'

describe '#Game', ->
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
	it 'should have a total score', ->
		@g1.get('score').should.equal 1290
		@g2.get('score').should.equal 255
	it 'should update the total score when a round is changed', ->
		round = @g1.rounds.at 0
		kit = round.kits.at 0
		kit.set('hits', 6)
		@g1.get('score').should.equal 1380
		round = @g2.rounds.at 1
		kit = round.kits.at 6
		kit.set('hits', 2)
		@g2.get('score').should.equal 305
	it 'should know if a game is finished', ->
		@g1.get('finished').should.equal true
		@g2.get('finished').should.equal false
	it 'should have a player id', ->
		@g1.get('player').id.should.equal 1
		@g2.get('player').id.should.equal 2
	it 'should have a match id', ->
		@g1.get('mId').should.equal 1
		@g2.get('mId').should.equal 1
