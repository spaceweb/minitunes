$.fn.serializeObject = function() {
  var values = {}
  $("form#ajax_signin :input").each( function(){
    values[this.name] = $(this).val();
  });
  
  return values;
}
 
SubmitLogin = {
    setup: function() {
  
        $("form#ajax_signin").submit(function(e){
            if (location.pathname !== "/login") {
                e.preventDefault();
            }
            var user_info = $(this).serializeObject();
            $.ajax({
                type: "POST",
                url: $(this).attr('action'),
                data: user_info,
                success: function(data){
                    jdata = jQuery(data);
                    logindata = jdata.find(".nav.pull-right");
                    $('.nav.pull-right').html(logindata);
                    $('#loginModal').modal('toggle');
                },
                error: function(data){
                    $(".alert.alert-error").remove();
                    jdata = '<div class="alert alert-error">'+data.responseText+'</div>'
                    $('.input.email.optional').before(jdata);
                }
            });
        });
  
    }
}
$(SubmitLogin.setup);