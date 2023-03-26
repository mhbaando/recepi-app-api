$(document).ready(() => {
    const overlay = $(".overlay")
    const modal = $(".model-contaier")
    let customerID;

    let gender = ""
    $("#gender input[type='radio']").on('click', function () {
        gender = $(this).val();
    })

    // show model on click
    $(".edit").on('click', function () {
        customerID = $(this).data('customer')
        overlay.attr('class', 'overlay')
        modal.attr('class', 'model-contaier')

        // prepapulate data to the model
        // 1. get the selected customer
        $.ajax({
            method: "GET",
            url: `/customer/findcustomer/${customerID}`,
            headers: { "X-CSRFToken": csrftoken },
            async: true,
            success: function (response) {
                if (!response.isError) {
                    response.Message.forEach(customer => {
                        //2. fill data to the html ellemets
                        $("#fname").attr('value', customer.full_name)
                        $("#dob").attr('value', customer.date_of_birth)
                        $("#mname").attr('value', customer.mother_name)

                        customer.gender === 'Male' ? $("#gender input[value='Male']").attr('checked', true) : $("#gender input[value='Female']").attr('checked', true)

                        $("#personalid").attr('value', customer.personal_id)
                        $(`#nation option[value='${customer.nationality_id}']`).attr('selected', true)
                        $(`#bload_group option[value='${customer.blood_group_id}']`).attr('selected', true)


                        $("#email").attr('value', customer.email)
                        $("#phone").attr('value', customer.phone)
                        $("#address").attr('value', customer.address)
                        $(`#state option[value='${customer.federal_state_id}']`).attr('selected', true)

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

    // hide modal on click
    overlay.on('click', function () {
        overlay.attr('class', 'hidden')
        modal.attr('class', 'hidden')
    })




    let state = ""
    $("#state").on("change", () => {
        state = $("#state option:selected").val()
    })

    let nation = ""
    $("#nation").on("change", () => {
        nation = $("#nation option:selected").val()
    })

    let group = ""
    $("#bload_group").on("change", () => {
        group = $("#bload_group option:selected").val()
    })

    // DOB
    let dob = ""
    $("#dob").on('click', function () {
        dob = $(this).val()
    })


    // submit
    $("#update_form").on('submit', function (e) {
        e.preventDefault()

        let formData = new FormData(this);
        const full_name = $("#fname").val().trim().split(" ")
        const personal_id = $("#personalid").val()
        const email = $("#email").val()
        const address = $("#address").val()
        const phone = $("#phone").val()
        const mother_name = $("#mname").val()


        //  check if no change in state, nation, blooad group 
        if (gender.trim().length <= 0 || state.trim().length <= 0 || group.trim().length <= 0 || nation.trim().length <= 0 || dob.trim().length <= 0) {
            gender = $("#gender input[type='radio']:checked").val()
            state = $("#state option:selected").val()
            nation = $("#nation option:selected").val()
            group = $("#bload_group option:selected").val()
            dob = $("#dob").val()
        }

        if (full_name.length < 4 || full_name.length > 4) {
            return Swal.fire("Error", 'Name can be only 4 names', "error");
        }

        const f_name = full_name[0]
        const m_name = full_name[1]
        const t_name = full_name[2]
        const fo_name = full_name[3]

        formData.append("first_name", f_name);
        formData.append("second_name", m_name);
        formData.append("last_name", t_name);
        formData.append("fourth_name", fo_name);
        formData.append("full_name", full_name.join(" "));
        formData.append("mother_name", mother_name);
        formData.append("personal_id", personal_id);
        formData.append("gender", gender);
        formData.append("blood_group", group);
        formData.append("nationality", nation);
        formData.append("email", email);
        formData.append("phone", phone);
        formData.append("dob", dob);
        formData.append("address", address);
        formData.append("state", state);
        formData.append("customer_id", customerID);

        $.ajax({
            method: "POST",
            url: `/customer/updatecustomer/`,
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