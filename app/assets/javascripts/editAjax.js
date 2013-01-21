$.fn.serializeObjectEdit = function() {
  var values = {}
  $("form#ajax_edit :input").each( function(){
    values[this.name] = $(this).val();
  });
  
  return values;
}
 
SubmitEdit = {
    setup: function() {
  
        $("form#ajax_edit").submit(function(e){
            if (location.pathname !== "/users/edit") {
                e.preventDefault();
            }
            var user_info = $(this).serializeObjectEdit();
            $.ajax({
                type: "PUT",
                url: $(this).attr('action'),
                data: user_info,
                success: function(data){
                    $('#editModal').modal('toggle');
                    $('#editModal').remove();
                },
                error: function(data){
                    $(".alert.alert-error").remove();
                    jdata = '<div class="alert alert-error">There are some errors, please correct them.</div>'
                    $('.input.email.optional').before(jdata);
                }
            });
        });
  
    }
}
$(SubmitEdit.setup);