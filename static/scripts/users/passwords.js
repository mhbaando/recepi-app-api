$(document).ready(function() {
  const overlay = $(".overlay")
  const modal = $(".model-contaier")
  let userID = ''

  // change password
  const btnChange = $("#change")
  btnChange.on('click', function() {
    overlay.attr('class', "overlay");
    modal.attr('class', 'model-contaier')
  })

  // hide modal if overlay is clicked
  overlay.on('click', () => {
    overlay.attr('class', "hidden");
    modal.attr('class', 'hidden')
  })



  // change password form
  $("#changeform").on('submit', function(e) {
    e.preventDefault()
    userID = $("#user_id").val()
    const opass = $("#opassword").val()
    const npass = $("#npassword").val()
    const cpass = $("#cpassword").val()

    // validate input
    if (!opass || !npass || !cpass) {
      Swal.fire('Error', 'All Feilds are required', 'error');
    }

    // check if confirm pass and new pass are equal 
    if (npass !== cpass) {
      Swal.fire('Error', 'New password and confirm password are not equal', 'error')
    }

    let formData = new FormData(this);
    formData.append('id', userID)
    formData.append('opass', opass)
    formData.append('cpass', cpass)
    formData.append('npass', npass)

    $.ajax({
      method: "POST",
      url: "/change_password",
      headers: { "X-CSRFToken": csrftoken },
      processData: false,
      contentType: false,
      data: formData,
      async: true,
      success: function(response) {
        if (!response.isError) {
          Swal.fire({
            title: "Success",
            text: response.Message,
            icon: "success",
            confirmButtonText: "Ok",
            confirmButtonClass: "btn btn-success mt-2",
            buttonsStyling: !1,
          }).then(function(e) {
            if (e.value) {
              Swal.DismissReason.cancel;
              location.replace('/customer/list')
            }
          });

          // resete the form 
          $("#reg_form")[0].reset()

        } else {
          Swal.fire("Error", response.Message, "error");
        }
      },
      error: function(error) {
        // handle error 
        Swal.fire("Error", error.responseText, "error");

      }
    })



  })


  // reset password
  const btnReset = $("#reset")
  btnReset.on('click', function() {
    userID = $("#user_id").val()

    if (!userID) {
      Swal.fire('Error', 'Provide and ID', 'error')
    }
    swal.fire({
      title: 'Reset Password',
      text: "Are You Sure to Reset a Password",
      type: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Yes',
      confirmButtonClass: "btn btn-success w-xs me-2",
      buttonsStyling: !1,
      cancelButtonClass: "btn btn-danger",
    }).then(function(result) {
      if (result.isConfirmed) {
        // Send Request to the server
        $.ajax({
          method: "GET",
          url: "/reset_password/" + userID,
          headers: { "X-CSRFToken": csrftoken },
          processData: false,
          contentType: false,
          async: true,

          success: function(response) {
            if (!response.isError) {
              Swal.fire({
                title: "Success",
                text: response.Message,
                icon: "success",
                confirmButtonClass: "btn btn-primary w-xs mt-2",
                buttonsStyling: !1,
                showCloseButton: !0,
              }).then((e) => {
                // refresh the page
                document.location.reload()
              });
            } else {
              Swal.fire({
                title: "Error",
                text: response.Message,
                icon: "error",
                confirmButtonClass: "btn btn-primary w-xs mt-2",
                buttonsStyling: !1,
                showCloseButton: !0,
              });
            }
          },
          error: function(response) {
            Swal.fire({
              title: "Error",
              text: response.Message,
              icon: "error",
              confirmButtonClass: "btn btn-primary w-xs mt-2",
              buttonsStyling: !1,
              showCloseButton: !0,
            });
          },
        });
      }
    })
  })
})
