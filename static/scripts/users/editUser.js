$(document).ready(function () {
    const overlay = $(".overlay")
    const modal = $(".model-contaier")
    let userID = ''
    // show modal on click
    const editbtns = document.querySelectorAll("#edit")
    editbtns.forEach(editbtn => {
        editbtn.addEventListener('click', function () {
            overlay.attr('class', 'overlay')
            modal.attr('class', 'model-contaier')
            userID = $(this).data('userid')

            $.ajax({
                method: "GET",
                url: `/find_user/${userID}`,
                headers: { "X-CSRFToken": csrftoken },
                async: true,
                success: function (response) {
                    if (!response.isError) {
                        $("#fname").attr('value', response.fname)
                        $("#lname").attr('value', response.lname)
                        $("#email").attr('value', response.email)
                        $("#phone").attr('value', response.phone)
                        $('#uploadedAvatar').attr('src', response.img);
                        if (response.type) {
                            $("#state option:eq(0)").prop("selected", true);
                            $(`#state`).prop('disabled', true);
                        }
                        else {
                            $(`#state`).prop('disabled', false);
                            $(`#state option[value='${response.state}']`).prop('selected', true)
                        }
                        if (response.gender.toLowerCase() === 'male') {
                            $("#gender input[value='Male']").attr('checked', true)
                        } else {
                            $("#gender input[value='Female']").attr('checked', true)
                        }
                    }
                    else {
                        Swal.fire("Error", response.Message, "error");
                    }
                },
                error: function (error) {
                    Swal.fire("Error", error.responseText, "error");
                }
            })
        })
    })

    // customer image
    $('#upload').change(function () {
        const file = this.files[0];
        if (file) {
            let reader = new FileReader();
            reader.onload = function (event) {
                $('#uploadedAvatar').attr('src', event.target.result);
            }
            reader.readAsDataURL(file);
        }
    });

    // hide modal on click
    $("#cancelbtn").on('click', function () {
        overlay.attr('class', 'hidden')
        modal.attr('class', 'hidden')
    })





})