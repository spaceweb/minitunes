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
        jdata = jQuery(data);
        registerModal = jdata.find("#registerModal");
        $('#main').after(registerModal);
        $('#registerModal').slideDown().modal();
        $(Register.setup);
        return(false);
    },
}
$(Register.setup);
