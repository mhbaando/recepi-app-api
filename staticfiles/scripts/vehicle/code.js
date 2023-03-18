$(document).ready(()=>{



    const overlay = $(".overlay-code")
    const modal = $(".containerr_code")
    const cancle = $(".Close-btn")

    $("#code_btn").on("click", function(){
        overlay.attr("class","overlay-code")
        modal.attr("class","containerr_code")
    })

    overlay.on("click", function(){
        overlay.attr("class","hidden")
        modal.attr("class","hidden")
    })
    cancle.on('click',function(){
        overlay.attr('class', 'hidden')
        modal.attr('class','hidden')
    })

    
    $("#codebtn").on('submit', function(e){
        e.preventDefault()
     
     let formData = new FormData(this);
   
     const code = $("#code_name").val()
   
    formData.append("code", code);
     $.ajax({
        method: "POST",
        url: `/vehicles/codeplate/`,
        headers: { "X-CSRFToken": csrftoken },
        processData: false,
        contentType: false,
        data :formData,
        async: true,
        success: function(response){
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
        error: function(error){
            Swal.fire("Error", error.responseText, "error");
        }
    })
})


})