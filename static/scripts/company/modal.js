$(document).ready(function () {
  const overlay = $(".overlay")
  const modal = $(".model-container")
  const form = $("#block-form")
  const form1 = $("#edit-form")

  const button = $("#btnprofile")
  const cursor = $(".cursor")
  let companyID;
  // block company
  // show model on click
  const btn_block = document.querySelectorAll("#block-btn")
  // loop over the node list
  btn_block.forEach(btn => {
    btn.addEventListener('click', function () {
      companyID = $(this).data('companyid')
      overlay.attr('class', 'overlay')
      modal.attr('class', 'model-contaier')

    })
  });
  const btnblock = document.querySelectorAll("#blockbtn")




  // loop over the node list
  btnblock.forEach(btn => {
    btn.addEventListener('click', function () {
      companyID = $(this).data('companyid')
      overlay.attr('class', 'overlay')
      modal.attr('class', 'model-contaier')

    })





  });
  // profile modal
  const btnprofile = document.querySelectorAll("#btnprofile")
  // loop over the node list
  btnprofile.forEach(btn => {
    btn.addEventListener('click', function () {
      companyName = $(this).data('company_name')
      cWebsite = $(this).data('webiste')
      cAddress = $(this).data(' address')
      cRegisterNo = $(this).data('reg_no')

      overlay.attr('class', 'overlay')
      modal.attr('class', 'model-contaier')

    })
  });

  $(".btn_block").on("click", () => {

    overlay.attr("class", "overlay")
    modal.attr("class", "model-container")
  })

  overlay.on("click", () => {
    overlay.attr("class", "overlay hidden")
    modal.attr("class", "model-container hidden")
  })

  cursor.on("click", () => {
    overlay.attr("class", "overlay hidden")
    modal.attr("class", "model-container hidden")
  })

  $(".close").on("click", () => {
    overlay.attr("class", "overlay hidden")
    modal.attr("class", "modal-footer hidden")
  })



  let companyDoc = ""
  $("#doc").on("change", function () {
    let file = this.files[0]
    if (file) {
      companyDoc = file
      $("#doc-name").text(file.name)
    } else {
      companyDoc = undefined
    }





  })

  // send data to the backend 
  // block company 
  form.on('submit', function (e) {
    e.preventDefault()
    const desc = $('#desc').val()


    if (!companyDoc) {
      return Swal.fire("Error", "Uppload Verification Document", "error");
    }

    if (desc.trim().length <= 0) {
      return Swal.fire("Error", "Description Is Required", "error");
    }


    let companyInfo;

    const formData = new FormData(this)

    formData.append('co_id', companyID)
    formData.append('co_desc', desc),
      formData.append('co_doc', companyDoc)

    $.ajax({
      method: "POST",
      url: "/customer/company_block",
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

          // resete the form 
          $("#re_form")[0].reset()

        } else {
          Swal.fire("Error", response.Message, "error");
        }
      },
      error: function (error) {
        Swal.fire("Error", error.responseText, "error");
      }
    })
  })


  $("#unblockbtn").on('click', function () {
    const co_id = $(this).data('coid')

    $.ajax({
      method: 'GET',
      url: `/customer/company_unblock/${co_id}`,
      processData: false,
      contentType: false,
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
    })
  })

})





