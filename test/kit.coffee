chai = require 'chai'
should = chai.should()

{Kit} = require '../lib/Kit'

describe '#Kit', ->
	before ->
		@kit1 = new Kit({
			value: 15, 
			hits: 2
		})
		@kit2 = new Kit({
			value: 16, 
			hits: 0
		})
		true
	it 'should have a value', ->
		@kit1.get('value').should.equal 15
		@kit2.get('value').should.equal 16
	it 'should have the number of hits', ->
		@kit1.get('hits').should.equal 2
		@kit2.get('hits').should.equal 0
	it 'should calculate the total score from the hit', ->
		@kit1.get('score').should.equal 30
		@kit2.get('score').should.equal 0
	it 'should update the score after a hit count changes', ->
		@kit1.set 'hits', 4
		@kit1.get('score').should.equal 60