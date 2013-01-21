Login = {
    setup: function() {
        $(".link-Login").one("click", function(event) {
            event.preventDefault();
            $.ajax({
                url: '/login',
                type: 'GET',
                success: Login.appendLogin
            });
        return(false);
        })
    },
    appendLogin: function(data) {
        if (!$("#loginModal").length>0) {
            jdata = jQuery(data);
            loginmodal = jdata.find("#loginModal");
            $('#main').after(loginmodal);
        }
        $('#loginModal').slideDown().modal();
        $(Login.setup);
        $(SubmitLogin.setup);
        return(false);
    },
}
$(Login.setup);
