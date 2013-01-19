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
        jdata = jQuery(data);
        loginmodal = jdata.find("#loginModal");
        $('#main').after(loginmodal);
        $('#loginModal').slideDown().modal();
        $(Login.setup);
        return(false);
    },
}
$(Login.setup);
