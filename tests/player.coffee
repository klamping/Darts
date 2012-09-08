chai = require 'chai'
should = chai.should()

Backbone = require 'backbone'
{Game} = require '../src/Game'
{Match} = require '../src/Match'
{Player} = require '../src/Player'

describe '#Player', ->
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
	it 'should have a player id', ->
		@p1.id.should.equal 1
		@p2.id.should.equal 2
	it 'should have a name', ->
		@p1.get('name').should.equal "Kevin"
		@p2.get('name').should.equal "Paul"
	it 'should have a total record', ->
		@p1.get('record').should.equal [1, 0]
		@p2.get('record').should.equal [0, 1]
	it 'should update the record after a game update', ->
		@p1.get('record').should.equal [1, 1]
		@p2.get('record').should.equal [1, 1]