Matches = new Meteor.Collection("matches");

if Meteor.is_server
  Meteor.publish "matches", (playerId) ->
    Matches.find {channel: playerId}

if Meteor.is_client
  Meteor.subscribe "matches", 1;
