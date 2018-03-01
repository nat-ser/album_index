$(function() {
  function bindAjaxSubmit() {
    $("#song-search").on("ajax:success", function(event, data) {
      debugger;
      // $("#error-msg").css("display", "none")
    }).on("ajax:error", function(event, xhr, status) {
       debugger;
      // var error = $.parseJSON(xhr.responseText).error
      // displayErrors(error);
    });
  }

  bindAjaxSubmit();
})
