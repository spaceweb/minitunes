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
            console.log("Route:::", $(this).attr('action'), user_info);
            $.ajax({
                type: "POST",
                url: $(this).attr('action'),
                data: user_info,
                success: function(data){
                    console.log("The Devise Response: " + JSON.stringify(data));
                    jdata = jQuery(data);
                    logindata = jdata.find(".nav.pull-right");
                    console.log(logindata);
                    $('.nav.pull-right').html(logindata);
                    $('#loginModal').modal('toggle');
                },
                error: function(data){
                    console.log(location.pathname);
                    console.log("Error Response: " + JSON.stringify(data));
                    //alert("The Devise Response: " + JSON.stringify(json));
                }
            });
        });
  
    }
}
$(SubmitLogin.setup);