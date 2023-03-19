$(document).ready(() => {
    $("#print-customer").on('click', function () {
        $.ajax({
            method: 'GET',
            url: '/customer/print_customer',
            async: true,
            success: function (res) {
                console.log(res)
            }
        })
    })
})