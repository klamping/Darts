// Generated by CoffeeScript 1.3.3
(function() {
  var Backbone, Player, root,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  root = typeof exports !== "undefined" && exports !== null ? exports : this;

  if (!(typeof Meteor !== "undefined" && Meteor !== null)) {
    Backbone = require('backbone');
  }

  Player = (function(_super) {

    __extends(Player, _super);

    function Player() {
      return Player.__super__.constructor.apply(this, arguments);
    }

    Player.prototype.initialize = function() {
      return this.set('record', [0, 0]);
    };

    return Player;

  })(Backbone.Model);

  root.Player = Player;

}).call(this);
