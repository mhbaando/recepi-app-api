$(document).ready(() => {


    const overlay = $(".overlay-assign")
    const modal = $(".containerr")
    const cancle = $(".Close-btn")


    $("#manage_btn").on("click", function () {
        overlay.attr("class", "overlay-assign")
        modal.attr("class", "containerr")
    })

    overlay.on("click", function () {
        overlay.attr("class", "hidden")
        modal.attr("class", "hidden")
    })

    cancle.on('click', function () {
        overlay.attr('class', 'hidden')
        modal.attr('class', 'hidden')
    })

    let manage_id = ""

    const liscence_btn = document.querySelectorAll("#manage_btn")
    // loop over the node list
    liscence_btn.forEach(btn => {
        btn.addEventListener('click', function () {
            manage_id = $(this).data('liscences')
            overlay.attr('class', 'overlay')
            modal.attr('class', 'model-contaier')
            $.ajax({
                method: "GET",
                url: `/customer/status_licenses/${manage_id}`,
                headers: { "X-CSRFToken": csrftoken },
                async: true,
                success: function (response) {
                    if (!response.isError) {
                        response.Message.forEach(liscences => {
                            // 2. fill data to the html ellemets

                            liscences.status === 'Active' ? $("#status input[value='Active']").attr('checked', true) : liscences.status === 'Lost' ? $("#status input[value='Lost']").attr('checked', true) : liscences.status === 'Expired' ? $("#status input[value='Expired']").attr('checked', true) : $("#status input[value='Suspended']").attr('checked', true)
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

        let state_r = ""
        $(".state_r input[type='radio']").on('click', function () {
            state_r = $(this).val();
        })



        $("#manage").on('submit', function (e) {
            e.preventDefault()

            let formData = new FormData(this);




            //  check if no change happens
            if (state_r.trim().length <= 0) {

                status_r = $("#status input[type='radio']:checked").val()

            }
            formData.append("status_r", status_r);
            formData.append("manage_id", manage_id);
            $.ajax({
                method: "POST",
                url: `/customer/edit_manage/${manage_id}`,
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




