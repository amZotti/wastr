$(document).ready(function() {
  $(".upvote, .downvote").click(function(event) {
    var button = $(event.target).closest("input");
    var path = button.closest('[action]').attr("action");

    $.post(path).done(function(data) {
      var postId = data.post_id;
      var score = $("#score_" + postId);
      $(score).text("Score: " + data.score)
    });

    return false;
  });
});
