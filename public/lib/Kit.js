// Generated by CoffeeScript 1.3.3
(function() {
  var Backbone, Kit,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  if (!(typeof Meteor !== "undefined" && Meteor !== null)) {
    Backbone = require('backbone');
  }

  Kit = (function(_super) {

    __extends(Kit, _super);

    function Kit() {
      return Kit.__super__.constructor.apply(this, arguments);
    }

    Kit.prototype.defaults = {
      'hits': 0
    };

    Kit.prototype.initialize = function() {
      this.set('score', this.getScore());
      return this.on('change:hits', function() {
        return this.set('score', this.getScore());
      });
    };

    Kit.prototype.getScore = function() {
      return this.get('hits') * this.id;
    };

    return Kit;

  })(Backbone.Model);

  if ((typeof exports !== "undefined" && exports !== null)) {
    exports.Kit = Kit;
  }

}).call(this);
