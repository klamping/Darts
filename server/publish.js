Players = new Meteor.Collection("players");
Meteor.publish("players", function () {
    return Players.find({});
});

Matches = new Meteor.Collection("matches");
    
Meteor.publish("matches", function () {
    return Matches.find({});
});