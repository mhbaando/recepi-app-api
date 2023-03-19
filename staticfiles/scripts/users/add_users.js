$(document).ready(function () {
  let UserType = $("#UserType");
  let state = $("#state")

  let Image = "";
  $("#Image").on("change", function (e) {
    Image = e.target.files[0];
  });

  UserType.on('change', function () {
    if ($(this).val() !== 'Superuser') {
      // if user is super user we dont need the state
      state.prop('disabled', false);
    }
    else {
      // if not super user we need state for that user
      $("#state option:eq(0)").prop("selected", true);
      state.prop('disabled', true);
    }
  })

  $("#Save").on("click", function (e) {
    e.preventDefault();
    let formData = new FormData();
    let FName = $("#FName").val();
    let LName = $("#LName").val();
    let Phone = $("#Phone").val();
    let Email = $("#Email").val();
    let Gender = $("#Gender").val();

    formData.append("fname", FName);
    formData.append("lname", LName);
    formData.append("phone", Phone);
    formData.append("email", Email);
    formData.append("gender", Gender);
    formData.append("image", Image);
    formData.append("type", UserType.val());

    if (UserType.val() !== 'Superuser') {
      formData.append("state", state.val());
    }

    if (state.val() == 'Select State' && UserType.val() !== 'Superuser') {
      return Swal.fire("Error", "Select A State", "error");
    }

    $.ajax({
      method: "POST",
      url: "/manage_users/AddNewUser",
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
            confirmButtonText: "Ok!!",
            confirmButtonClass: "btn btn-success mt-2",
            buttonsStyling: !1,
          }).then(function (e) {
            if (e.value) {
              Swal.DismissReason.cancel;
              location.reload();
            }
          });
        } else {
          Swal.fire("Error!!", response.Message, "error");
        }
      },
      error: function (response) { },
    });
  });
});
