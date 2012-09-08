// if the database is empty on server start, create some sample data.
Meteor.startup(function () {
  if (Matches.find().count() === 0) {
    var data = [
      {
        games: [
          {
            pid: 1,
            rounds: [
              [1,2,1,1,3,3,2],
              [1,2,1,1,3,3,2],
              [1,2,1,1,3]
            ]
          },
          {
            pid: 2,
            rounds: [
              [1,2,1,1,3,3,2],
              [1,2,1,1,3,3,2],
              [1,2,1]
            ]
          }
        ]
      }
    ];

    for (i = 0; i < data.length; i++) {
      match_id = Matches.insert(data[i].games);
    }
  }
});
