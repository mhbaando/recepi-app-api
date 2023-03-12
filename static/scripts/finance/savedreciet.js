$(document).ready(function () {
  $('#addnewreciet').on("click", function () {
     // if (!rv_number || rv_from.trim().length <= 0 || !reason ) {
      //   Swal.fire("Error", "All filds are required", "error");
      //   return false

    // Prepare posting data
    $("#reciet_form").on('submit', function (e) {
      e.preventDefault();
      let formData = new FormData();
      let rv_number = $("#rvnumber").val()
      let rv_from = $("#rcfrom").val();
      let reason = $("#reason").val();
      let personal_id = $("#personal_id").val();
      let rvamount = Number($("#rv_amount").val().split("$")[1]);

     



      // Append all these to form-data
      formData.append("rv_number", rv_number);
      formData.append("rv_from", rv_from);
      formData.append("reason", reason);
      formData.append("rvamount", rvamount);
      formData.append("personal_id", personal_id)

      $.ajax({
        method: "POST",
        url: "/finance/save_reciept/reciet_form",
        headers: { "X-CSRFToken": csrftoken },
        processData: false,
        contentType: false,
        data: formData,
        async: false,
        success: function (response) {
          if (!response.isError) {
            Swal.fire({
              title: "Successfully",
              text: response.Message,
              icon: "success",
              confirmButtonClass: "btn btn-primary w-xs mt-2",
              buttonsStyling: !1,
              showCloseButton: !0,
            }).then((e) => {
              location.replace(
                '/finance/receipt'
              );
            });
          } else {
            Swal.fire({
              title: "Something Wrong!!",
              text: response.Message,
              icon: "error",
              confirmButtonClass: "btn btn-primary w-xs mt-2",
              buttonsStyling: !1,
              showCloseButton: !0,
            });
          }
        },
        error: function (response) { },
      });
    });
  })
})