$(document).ready(() => {
    const overlay = $(".overlay")
    const modal = $(".model-contaier")
    let companyID;
    // show model on click
    $(".edit").on('click', function () {
        overlay.attr('class', 'overlay')
        modal.attr('class', 'model-contaier')
        companyID = $(this).data('company')
        console.log($(this))

        // prepapulate data to the model
        // 1. get the selected compnay
        $.ajax({
            method: "GET",
            url: `/customer/findcompany/${companyID}`,
            headers: { "X-CSRFToken": csrftoken },
            async: true,
            success: function (response) {
                if (!response.isError) {
                    response.Message.forEach(company => {
                        //2. fill data to the html ellemets
                        $("#cname").attr('value', company.company_name)
                        $("#cphone").attr('value', company.phone)
                        $("#cemail").attr('value', company.email)
                        $("#cwebsite").attr('value', company.website)
                        $("#caddress").attr('value', company.address)
                        $("#cregister").attr('value', company.reg_no)
                        $(`#state option[value='${company.federal_state_id}']`).attr('selected', true)

                    });
                } else {
                    Swal.fire("Error", response.Message, "error");
                }
            },
            error: function (error) {
                Swal.fire("Error", error.responseText, "error");
            }
        })
        console.log(companyID)
    })

    // hide modal on click
    overlay.on('click', function () {
        overlay.attr('class', 'hidden')
        modal.attr('class', 'hidden')
    })

    // for state
    let state = ""
    $("#state").on("change", () => {
        state = $("#state option:selected").val()
    })

    // submit
    $("#update_form").on('submit', function (e) {
        e.preventDefault()
        //  check if no change in state, nation, blooad group 
        const state = $("#state option:selected").val()
        const cname = $("#cname").val()
        const cphone = $("#cphone").val()
        const cemail = $("#cemail").val()
        const caddress = $("#caddress").val()
        const cwebsite = $("#cwebsite").val()
        const cregister = $("#cregister").val()

        let formData = new FormData(this);

        formData.append("company_id", companyID);
        formData.append("cname", cname);
        formData.append("cphone", cphone);
        formData.append("cemail", cemail);
        formData.append("caddress", caddress);
        formData.append("cwebsite", cwebsite);
        formData.append("cregister", cregister);
        formData.append("cstate", state);


        $.ajax({
            method: "POST",
            url: `/customer/updatecompany/`,
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