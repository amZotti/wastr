$(function() {
  $(".post-reply-form").hide(); //do this in css

  $(".post-reply-link").click(function() {
    $(".post-reply-form").toggle();

    return false;
  });

  $("#post-reply-form").submit(function() {
    var path = $("#post-reply-form").attr("action");
    $.post(
      path,
      $("#post-reply-form").serialize()
    ).done(function(html){
      $("#post-reply-list").prepend(html);
      $("#comment_body").val("");
    });

    return false;
  });
});
