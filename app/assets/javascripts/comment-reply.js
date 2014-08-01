$(function() {
  $("form").hide(); //do this in css

  $("a.comment-reply-link").click(function() {
    var commentElementId = $(this).data("comment-selector");
    $("#" + commentElementId + " form").show()
    return false;
  });

  $("form.comment-reply-form").submit(function() {
    var commentElementId = $(this).data("comment-selector");
    var form = $(this);

    $.post(
      form.attr("action"),
      form.serialize()
    ).done(function(html){
      $("#" + commentElementId + " ul").prepend(html);
      form.find("#comment_body").val("");
    });

    return false;
  });
});
