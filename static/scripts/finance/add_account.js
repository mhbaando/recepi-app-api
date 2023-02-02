$(document).ready(function(){
    $('#add_new_account').on("click", function(){
    
    
    // Prepare posting data
    let formData = new FormData();
    let account_number = $("#account-number").val();
    let account_name = $("#account-name").val();
    let account_type = $("#account-type").val();
    let account_amount = $("#account-amount").val();

    // Append all these to form-data
    formData.append("account_number", account_number);
    formData.append("account_name", account_name);
    formData.append("account_type", account_type);
    formData.append("account_amount", account_amount);

    $.ajax({
      method: "POST",
      url: "/finance/manage_accounts/AddNewAccount",
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
            location.reload();
            // location.replace(
            //   `/employees/employee_profile/${response.EmployeeID}`
            // );
          });
        } else {
          if (response.isMessage) {
            Swal.fire({
              title: "Something Wrong!!",
              text: response.Message,
              icon: "error",
              confirmButtonClass: "btn btn-primary w-xs mt-2",
              buttonsStyling: !1,
              showCloseButton: !0,
            });
          } else {
            $("#EmployeeDuplicate").modal("show");
            $("#duplicate_name").text(response.Message.Name);
            $("#duplicate_name_display").text(response.Message.Name);
            $("#duplicate_id").text(response.Message.ID);
            $("#duplicate_id").attr("src", response.Message.File);
          }
        }
      },
      error: function (response) {},
    });
  });

});