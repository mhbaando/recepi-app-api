$(document).ready(() => {
    const overlay = $(".overlay")
    const modal = $(".model-contaier")
    let accountID;
    // show model on click

    
    const updatebtn = document.querySelectorAll("#update")


    $("#edit").on('click', function () {
        overlay.attr('class', 'overlay')
        modal.attr('class', 'model-contaier')
        accountID = $(this).data('accountid')
        
        // prepapulate data to the model
        // 1. get the selected 
        $.ajax({
            method: "GET",
            url: `/finance/find_account/${accountID}`,
            headers: { "X-CSRFToken": csrftoken },
            async: true,
            success: function (response) {
                if (!response.isError) {
                    $("#accnumber").attr('value', response.account_number)
                    $("#acctype ").attr('value', response.account_type)
                    $(`#acctype option[value='${response.account_type.id}']`).attr('selected', true)

                    $("#accname").attr('value', response.account_name)
                    $("#accamount").attr('value', response.amount)
                } else {
                    Swal.fire("Error", response.Message, "error");
                }
            },
            error: function (error) {
                Swal.fire("Error", error.responseText, "error");
            }
        })

    })

    // hide modal on click
    overlay.on('click', function () {
        overlay.attr('class', 'hidden')
        modal.attr('class', 'hidden')
    })




    // submit
    $("#updateaccform").on('submit', function (e) {
        e.preventDefault()
        //  check if no change in state, nation, blooad group 
  
        const accnumber = $("#accnumber").val()
        const acctype = $("#acctype option:selected").val()
        const accname = $("#accname").val()
        const accamount = $("#accamount").val()

        let formData = new FormData(this);

        formData.append("account_id", accountID);
        formData.append("accnumber", accnumber);
        formData.append("acctype", acctype);
        formData.append("accname", accname);
        formData.append("accamount", accamount);
      


        $.ajax({
            method: "POST",
            url: `/finance/update_account/`,
            headers: { "X-CSRFToken": csrftoken },
            processData: false,
            contentType: false,
            data: formData,
            async: true,
            success: function (response) {
                if (!response.isError) {
                    Swal.fire({
                        title: "Success",
                        text: response.Message,
                        icon: "success",
                        confirmButtonText: "Ok",
                        confirmButtonClass: "btn btn-success mt-2",
                        buttonsStyling: !1,
                    }).then(function (e) {
                        if (e.value) {
                            Swal.DismissReason.cancel;
                            location.reload()
                        }
                    });

                } else {
                    Swal.fire("Error", response.Message, "error");
                }
            },
            error: function (error) {
                Swal.fire("Error", error.responseText, "error");
            }
        })
    })
})