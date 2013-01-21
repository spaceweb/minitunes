$.fn.serializeObjectRegister = function() {
  var values = {}
  $("form#ajax_signup :input").each( function(){
    values[this.name] = $(this).val();
  });
  
  return values;
}
 
SubmitRegister = {
    setup: function() {
  
        $("form#ajax_signup").submit(function(e){
            if (location.pathname !== "/register") {
                e.preventDefault();
            }
            var user_info = $(this).serializeObjectRegister();
            $.ajax({
                type: "POST",
                url: $(this).attr('action'),
                data: user_info,
                success: function(data){
                    jdata = jQuery(data);
                    if (jdata.find("#registerModal").length>0) {
                        registerBody = jdata.find("#registerModal .modal-body");
                        $("#registerModal .modal-body").html(registerBody.children());
                    }
                    else {
                        registerdata = jdata.find(".nav.pull-right");
                        $('.nav.pull-right').html(registerdata);
                        $('#registerModal').modal('toggle');
                        $('#registerModal').remove();
                        $(".link-Profile").popover({
                                placement : 'bottom',
                                html : true,
                                title : '<strong>Welcome to Minitunes!</strong>',
                                content : 'Now go ahead and meet new people and learn about their tastes or exchange comments on your favorite bands or artists.',
                                }).popover('show');
                        setTimeout("$('.link-Profile').popover('hide')", 10000);
                    }
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
$(SubmitRegister.setup);