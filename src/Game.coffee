Backbone = require 'backbone'

{Kit} = require '../lib/Kit'
{Round} = require '../lib/Round'

class RoundList extends Backbone.Collection
    model: Round

class Game extends Backbone.Model
	defaults:
		values : [15, 16, 17, 18, 19, 20, 25]

root = exports ? window 
root.Game = Game