$(document).ready(() => {
    let license_ID = ""


    const overlay = $(".overlay")
    const modal = $(".model-contaier")
    const cancle = $(".Close-btn")

    $("#edit_liscence").on("click", function () {
        overlay.attr("class", "overlay")
        modal.attr("class", "model-contaier")
    })

    overlay.on("click", function () {
        overlay.attr("class", "hidden")
        modal.attr("class", "hidden")
    })
    cancle.on('click', function () {
        overlay.attr('class', 'hidden')
        modal.attr('class', 'hidden')
    })



    const liscence_btn = document.querySelectorAll("#edit_liscence")
    // loop over the node list
    liscence_btn.forEach(btn => {
        btn.addEventListener('click', function () {
            license_ID = $(this).data('liscence')
            overlay.attr('class', 'overlay')
            modal.attr('class', 'model-contaier')
            console.log();


            $.ajax({
                method: "GET",
                url: `/customer/find_liscence/${license_ID}`,
                headers: { "X-CSRFToken": csrftoken },
                async: true,
                success: function (response) {
                    if (!response.isError) {
                        console.log(response.Message)
                        response.Message.li_info.forEach(liscences => {
                            const registerDate = new Date(liscences.created_at)
                            const options = {
                                month: 'short',
                                day: '2-digit',
                                year: 'numeric'
                            };
                            registerDate.getFullYear()

                            $("#reg_number").attr('value', liscences.reg_no)
                            $("#exp_date").attr('value', new Date(liscences.expired_date).toLocaleDateString('en-US', options))
                            $("#reg_date").attr('value', registerDate.toLocaleDateString('en-US', options))

                            $(`#state option[value='${liscences.federal_state_id}']`).attr('selected', true)
                            $(`#type option[value='${liscences.type_id}']`).attr('selected', true)
                            $(`#place option[value='${liscences.place_of_issue_id}']`).attr('selected', true)

                        });

                        $.each(response.Message.rv_info, function (index, rv) {
                            $("#r_number").attr('value', rv.rv_number)
                        })

                        $.each(response.Message.owner_info, function (index, owner) {

                            $("#owner_lis").attr('value', owner.full_name)
                        })

                    } else {
                        Swal.fire("Error", response.Message, "error");
                    }
                },
                error: function (error) {
                    Swal.fire("Error", error.responseText, "error");
                }
            })
        })

        let state = ""
        $("#state").on('click', function () {
            state = $(this).val()
        })
        let type = ""
        $("#type").on('click', function () {
            type = $(this).val()
        })

        let place = ""
        $("#place").on('click', function () {
            place = $(this).val()
        })
        let state_r = ""
        $(".state_r input[type='radio']").on('click', function () {
            state_r = $(this).val();
        })


        // submit
        $("#update_form").on('submit', function (e) {
            e.preventDefault()

            //  check if no change happens
            if (state.trim().length <= 0 || type.trim().length <= 0 || place.trim().length <= 0) {
                state = $("#state option:selected").val()
                place = $("#place option:selected").val()
                type = $("#type option:selected").val()
            }

            let formData = new FormData(this);
            formData.append("state", state);
            formData.append("place", place);
            formData.append("type", type);
            $.ajax({
                method: "POST",
                url: `/customer/edit_liscence/${license_ID}`,
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
})




