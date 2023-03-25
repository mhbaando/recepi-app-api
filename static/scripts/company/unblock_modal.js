$(document).ready(function () {
  const overlay = $(".overlays")
  const modal = $(".model-containers")
  const form = $("#unblock-form")
  const btnunblock = document.querySelectorAll("#un_blockbtn")
  let companyID;

  btnunblock.forEach(btn => {
    btn.addEventListener('click', function () {
      companyID = $(this).data('coid')
      overlay.attr('class', 'overlay')
      modal.attr('class', 'model-contaier')
    })
  })

  overlay.on("click", () => {
    overlay.attr("class", "overlay hidden")
    modal.attr("class", "model-container hidden")
  })

  $(".cursor").on("click", () => {
    overlay.attr("class", "overlay hidden")
    modal.attr("class", "model-container hidden")
  })

  $(".close").on("click", () => {
    overlay.attr("class", "overlay hidden")
    modal.attr("class", "modal-footer hidden")
  })




  form.on('submit', function (e) {
    e.preventDefault()
    const reason = $('#reason').val()
    


    // requedst 
    const formData = new FormData(this)
    formData.append('co_id', companyID)
    formData.append('co_reason', reason),



      $.ajax({
        method: 'POST',
        url: `/customer/company_unblock/${companyID}`,
        processData: false,
        contentType: false,
        data:formData,
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