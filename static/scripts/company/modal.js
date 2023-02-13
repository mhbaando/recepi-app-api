$(document).ready(function () {
    const overlay = $(".overlay")
    const modal = $(".model-container")
    const cursor = $(".cursor")


    // block company

      // show model on click
      const btn_block = document.querySelectorAll("#block-btn")
      // loop over the node list
      btn_block.forEach(btn => {
          btn.addEventListener('click', function(){
              
              companyInfo.attr('value', selectedcompany)
              overlay.attr('class', 'overlay')
              modal.attr('class','model-contaier')
          })
      });
  
   

    $("#blockbtn").on("click",()=>{
        // overlay.classList.remove("hidden")
        // modal.classList.remove("hidden")
        overlay.attr("class", "overlay")
        modal.attr("class", "model-container")
    })

    overlay.on("click",()=>{
        overlay.attr("class", "overlay hidden")
        modal.attr("class", "model-container hidden")
    })
    
    cursor.on("click",()=>{
        overlay.attr("class", "overlay hidden")
        modal.attr("class", "model-container hidden")
    })

  $(".close").on("click",()=>{
       overlay.attr("class", "overlay hidden")
        modal.attr("class", "modal-footer hidden")
    })


    $("#doc").on("change",function(){
		let file = this.files[0]
		if(file){
			$("#doc-name").text(file.name)
		}
	})


     // send data to the backend 
    // block company 
    form.on('submit',function(e){
        e.preventDefault()
        const desc = $('#desc').val()

        // if(customerInfo.val().trim().length <= 0){
        //     return Swal.fire("Error", "No Customer Selected", "error");
        // }

        if(!companyDoc  ){
            return Swal.fire("Error", "Uppload Verification Document", "error");
        }

        if(desc.trim().length <= 0){
            return Swal.fire("Error", "Description Is Required", "error");
        }


        
        const companyID = companyInfo.val().split("-")[1]
        const formData = new FormData(this)

        formData.append('perosonalID', companyID)
        formData.append('desc',desc),
        formData.append('companyDoc',companyDoc)

        $.ajax({
            method: "POST",
            url: "/Company/modal_block",
            headers: { "X-CSRFToken": csrftoken },
            processData: false,
            contentType: false,
            data: formData,
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

                    // resete the form 
                    $("#re_form")[0].reset()
                   
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