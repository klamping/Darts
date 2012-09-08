chai = require 'chai'
should = chai.should()

Backbone = require 'backbone'
SandboxedModule = require('../../node-sandboxed-module/lib/sandboxed_module')
{Kit} = SandboxedModule.require('../src/Kit', {
  requires: {'backbone': Backbone}
});

{Round} = SandboxedModule.require('../src/Round', {
  requires: {'backbone': Backbone,}
});

{Round} = require '../src/Round'

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
		@r3.get('round').should.equal 3
	it 'should have a total score', ->
		@r1.get('score').should.equal 430
		@r2.get('score').should.equal 85
		@r3.get('score').should.equal 48
	it 'should update the total score when a kit is changed', ->
		@r1.kits.get(15).set('hits', 1)
		@r1.get('score').should.equal 445
		@r2.kits.get(25).set('hits', 2)
		@r2.get('score').should.equal 135
		@r3.kits.add new Kit {id: 19, hits: 1}
		@r3.get('score').should.equal 67
	it 'should not allow too many kits to be added', ->
		addTooMany = ->
			r = new Round
				kits: [1,2,3,4,5,6,7,8,9],
				round: 2
		addTooMany.should.throw(Error)
	it 'should count the number of throws left', ->
		@r1.getThrowsLeft().should.equal 0
		@r2.getThrowsLeft().should.equal 0
		@r3.getThrowsLeft().should.equal 2