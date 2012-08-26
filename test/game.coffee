chai = require 'chai'
should = chai.should()

{Kit} = require '../lib/Kit'
{Round} = require '../lib/Round'
{Game} = require '../lib/Game'

describe '#Game', ->
	before ->
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
			pId: 1,
			mId: 1
		@g2 = new Game
			rounds: g2Rounds
			pId: 2,
			mId: 1
	it 'should get the score from a single round', ->
		
	it 'should have a total score', ->
		@g1.get('score').should.equal 1290
		@g2.get('score').should.equal 233
	it 'should update the total score when a round is changed', ->
		@g1.get('score').should.equal 1290
		@g2.get('score').should.equal 233
	it 'should know if a game is finished', ->
		@g1.get('finished').should.equal true
		@g2.get('finished').should.equal false
		