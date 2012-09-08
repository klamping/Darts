Matches = new Meteor.Collection "matches"

if Meteor.is_server
  Meteor.publish "matches", (playerId) ->
    Matches.find {channel: playerId}

if Meteor.is_client
    console.log "Matches.find({})"
    Template.hello.match = ->
        Matches.find({})