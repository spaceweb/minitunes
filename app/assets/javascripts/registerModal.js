Register = {
    setup: function() {
        $(".link-Register").one("click", function(event) {
            event.preventDefault();
            $.ajax({
                url: '/register',
                type: 'GET',
                success: Register.appendRegister
            });
        return(false);
        })
    },
    appendRegister: function(data) {
        if (!$("#registerModal").length>0) {
            jdata = jQuery(data);
            registerModal = jdata.find("#registerModal");
            $('#main').after(registerModal);
        }
        $('#registerModal').slideDown().modal();
        $(Register.setup);
        $(SubmitRegister.setup);
        return(false);
    },
}
$(Register.setup);
