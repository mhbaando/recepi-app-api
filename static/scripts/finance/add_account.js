$(document).ready(function(){
    $('#add_new_account').on("click", function(){
    
    

      let accountpe = ""
      $("#accounttype").on("change",()=>{
        accountpe = $("#accounttype option:selected").val()
      })
    // Prepare posting data
    
    $("#acc_form").on('submit',function(e){
      e.preventDefault();
    let formData = new FormData();
    let acctnumber = $("#accnumber").val();
    let acctname = $("#accname").val();
    let accttype = $("#accounttype").val();
    let acctamount = $("#amount").val();

    // if(!acctnumber){
    //   alert("fill accnumber")
    // }

    // if(!acctname){
    //   alert("fill accname")
    // }
    // if(!accttype){
    //   alert("fill acctpe")
    // }
    // if(!acctamount){
    //   alert("fill accamount")
    // }
    if(!accountpe || accountpe === "Select account type"){
      return Swal.fire("Error", "Select account", "error");
  }

    // Append all these to form-data
    formData.append("account_number", acctnumber);
    formData.append("account_name", acctname);
    formData.append("account_type", accttype);
    formData.append("account_amount", acctamount);

   
  



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
      error: function (response) {},
    });
  });
    })})