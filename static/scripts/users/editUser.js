$(document).ready(function() {
  const overlay = $(".overlay")
  const modal = $(".model-contaier")
  let userID = ''
  // show modal on click
  const editbtns = document.querySelectorAll("#edit")
  editbtns.forEach(editbtn => {
    editbtn.addEventListener('click', function() {
      overlay.attr('class', 'overlay')
      modal.attr('class', 'model-contaier')
      userID = $(this).data('userid')

      $.ajax({
        method: "GET",
        url: `/find_user/${userID}`,
        headers: { "X-CSRFToken": csrftoken },
        async: true,
        success: function(response) {
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
        error: function(error) {
          Swal.fire("Error", error.responseText, "error");
        }
      })
    })
  })

  // customer image
  userImg = undefined
  $('#upload').change(function() {
    const file = this.files[0];
    if (file) {
      let reader = new FileReader();
      reader.onload = function(event) {
        $('#uploadedAvatar').attr('src', event.target.result);
        userImg = file
      }
      reader.readAsDataURL(file);
    }
  });

  // hide modal on click
  $("#cancelbtn").on('click', function() {
    overlay.attr('class', 'hidden')
    modal.attr('class', 'hidden')
  })
  let state = ""
  $("#state").on('click', function() {
    state = $(this).val()
  })


  // submit
  $("#edit_user").on('submit', function(e) {
    e.preventDefault()

    let formData = new FormData(this);

    const fname = $("#fname").val()
    const lname = $("#lname").val()
    const email = $("#email").val()
    const phone = $("#phone").val()



    //  check if no change happens
    if (state.trim().length <= 0) {
      state = $("#state option:selected").val()
      gender = $("#gender input[type='radio']:checked").val()

    }


    formData.append("fname", fname);
    formData.append("lname", lname);
    formData.append("email", email);
    formData.append("phone", phone);
    formData.append("state", state);
    formData.append("userID", userID);
    formData.append('img', userImg);

    $.ajax({
      method: "POST",
      url: "/updateuser/",
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
              location.reload()
            }
          });

        } else {
          Swal.fire("Error", response.Message, "error");
        }
      },
      error: function(error) {
        Swal.fire("Error", error.responseText, "error");
      }
    })
  })





})
