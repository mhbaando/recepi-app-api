$(document).ready(() => {
  const overlay = $(".overlay")
  const modal = $(".model-contaier")
  const form = $("#verify-form")
  const cancle = $(".cancle-btn")
  const customerInfo = $('#customer-info')

  // show model on click
  const vreify_btn = document.querySelectorAll("#verify-btn")
  // loop over the node list
  vreify_btn.forEach(btn => {
    btn.addEventListener('click', function() {
      const selectedCustomer = $(this).data('customer')
      customerInfo.attr('value', selectedCustomer)
      overlay.attr('class', 'overlay')
      modal.attr('class', 'model-contaier')
    })
  });

  // hide modal
  overlay.on('click', function() {
    overlay.attr('class', 'hidden')
    modal.attr('class', 'hidden')
  })
  cancle.on('click', function() {
    overlay.attr('class', 'hidden')
    modal.attr('class', 'hidden')
  })

  // doc uppload
  let customerDoc = ""
  $("#doc").change(function() {
    let file = this.files[0]
    if (file) {

      if (file.size > 2000000) {
        Swal.fire("Error", "File is larger then 2MB", "error")
        return false
      }
      $("#doc-name").text(file.name)
      customerDoc = file
    }
    else {
      customerDoc = undefined
    }
  })

  // send data to the backend 
  // verify user 
  form.on('submit', function(e) {
    e.preventDefault()
    const desc = $('#desc').val()

    if (customerInfo.val().trim().length <= 0) {
      return Swal.fire("Error", "No Customer Selected", "error");
    }

    if (!customerDoc) {
      return Swal.fire("Error", "Uppload Verification Document", "error");
    }

    if (desc.trim().length <= 0) {
      return Swal.fire("Error", "Description Is Required", "error");
    }



    const customerID = customerInfo.val().split("-")[1]
    const formData = new FormData(this)

    formData.append('perosonalID', customerID)
    formData.append('desc', desc),
      formData.append('customerDoc', customerDoc)

    $.ajax({
      method: "POST",
      url: "/customer/activate",
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

          // resete the form 
          $("#reg_form")[0].reset()

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
