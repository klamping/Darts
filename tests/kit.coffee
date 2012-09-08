chai = require 'chai'
should = chai.should()

Backbone = require 'backbone'

SandboxedModule = require('../../node-sandboxed-module/lib/sandboxed_module')
{Kit} = SandboxedModule.require('../src/Kit', {
  requires: {'backbone': Backbone}
});

describe '#Kit', ->
	before ->
		@kit1 = new Kit({
			id: 15, 
			hits: 2
		})
		@kit2 = new Kit({
			id: 16, 
			hits: 0
		})
		true
	it 'should have a value', ->
		@kit1.id.should.equal 15
		@kit2.id.should.equal 16
	it 'should have a hit count of zero if no hit count passed in', ->
		kit3 = new Kit({
			id: 0
		})
		kit3.get('hits').should.equal 0
		kit3.get('score').should.equal 0
	it 'should have the number of hits', ->
		@kit1.get('hits').should.equal 2
		@kit2.get('hits').should.equal 0
	it 'should calculate the total score from the hit', ->
		@kit1.get('score').should.equal 30
		@kit2.get('score').should.equal 0
	it 'should update the score after a hit count changes', ->
		@kit1.set 'hits', 4
		@kit1.get('score').should.equal 60

