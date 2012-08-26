chai = require 'chai'
should = chai.should()

{Kit} = require '../lib/Kit'
{Round} = require '../lib/Round'

describe '#Round', ->
	before ->
		r1Kits = [0, 1, 2, 3, 4, 5, 6]
		r2Kits = [1, 1, 1, 1, 1, 0, 0]
		r3Kits = [1, 1, 1, 0]
			
		@r1 = new Round
			kits: r1Kits, 
			round: 1
		@r2 = new Round
			kits: r2Kits,
			round: 2
		@r3 = new Round
			kits: r3Kits,
			round: 3
	it 'should have a throwing round number', ->
		@r1.get('round').should.equal 1
		@r2.get('round').should.equal 2
	it 'should have a total score', ->
		@r1.get('score').should.equal 430
		@r2.get('score').should.equal 85
	it 'should be able to update a single kit', ->
		@r1.setKitHits(15, 1)
		@r1.get('score').should.equal 445
		@r2.setKitHits(25, 2)
		@r2.get('score').should.equal 135
	it 'should not allow too many kits to be added', ->
		addTooMany = ->
			r = new Round
				kits: [1,2,3,4,5,6,7,8,9],
				round: 2
		addTooMany.should.throw(Error)
	it 'should count the number of throws left', ->
		@r1.getThrowsLeft().should.equal 0
		@r2.getThrowsLeft().should.equal 0
		@r3.getThrowsLeft().should.equal 3
		