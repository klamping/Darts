Matches = new Meteor.Collection("matches");

Meteor.subscribe 'matches', ->
    match = Matches.findOne({});

Players = new Meteor.Collection("players");

Meteor.subscribe 'players', ->
    player = Players.findOne({});


Template.hello.matches = ->
    Matches.find({});

Template.hello.players = ->
    Players.find({});