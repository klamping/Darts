chai = require 'chai'
should = chai.should()

{Kit} = require '../lib/Kit'
{Round} = require '../lib/Round'

describe '#Round', ->
	before ->
		r1Kits = [0, 1, 2, 3, 4, 5, 6]
		r2Kits = [1, 1, 1, 1, 1, 0, 0]
			
		@r1 = new Round
			kits: r1Kits, 
			round: 1
		@r2 = new Round
			kits: r2Kits,
			round: 2
	it 'should have a round number', ->
		@r1.get('round').should.equal 1
		@r2.get('round').should.equal 2
	it 'should have a total score', ->
		@r1.get('score').should.equal 430
		@r2.get('score').should.equal 85
	it 'should be able to update a single kit', ->
		@r1.setKitHits(15, 0)
	it 'should update the score when a kit is updated', ->
		#console.log @r1.set({value: 15, hits: 3})
