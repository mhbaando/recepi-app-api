$(document).ready(function () {

  let accountpe = ""
  $("#accounttype").on("change", () => {
    accountpe = $("#accounttype option:selected").val()
  })
  // Prepare posting data

  $("#acc_form").on('submit', function (e) {
    e.preventDefault();
    let formData = new FormData();
    let acctnumber = $("#accnumber").val();
    let acctname = $("#accname").val();
    let acctamount = $("#amount").val();

    if (!acctname || acctname.trim().length <= 0 || !acctnumber || acctnumber.trim().length <= 0 || !acctamount || acctamount.trim().length <= 0) {
      Swal.fire("Error", "All filds are required", "error");
      return false
    }
    if (!accountpe || accountpe === 'select a Account type') {
      Swal.fire("Error", "Select an account", "error");
      return false
    }
    // Append all these to form-data
    formData.append("account_number", acctnumber);
    formData.append("account_name", acctname);
    formData.append("account_type", accountpe);
    formData.append("account_amount", acctamount);

    $.ajax({
      method: "POST",
      url: "/finance/manage_accounts/AddNewAccount",
      headers: { "X-CSRFToken": csrftoken },
      processData: false,
      contentType: false,
      data: formData,
      async: true,
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
            location.replace('/finance/accounts');
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