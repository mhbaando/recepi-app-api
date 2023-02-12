$(document).ready(function () {
    // get user image and uppload doc
    let logoImage = ""
    let companyDoc = ""
    $('#upload').change(function(){
        const file = this.files[0];
        if (file){
            logoImage = file
        }else{
            logoImage = undefined
        }
    })

    $("#doc").on('change', function(){
        const file = this.files[0]
        if(file){
            companyDoc = file
        }else {
            companyDoc = undefined
        }
    })

    // get state 
    let state = ""
    $("#state").on("change",()=>{
        state = $("#state option:selected").val()
    })


    let owner = ""
    $("input[name=customers]").focusout(function(){
        owner = $(this).val()
    });

    $("#re_form").on('submit',function(e){
        e.preventDefault();
        
        const desc = $("#desc").val()
        const cname = $("#cname").val();
        const phone = $("#phone").val()
        const email = $("#email").val()
        const rnumber= $("#rnumber").val();
        const website = $("#website").val();
        const address = $("#address").val()

        let formData = new FormData();

        if(!logoImage ){
            return Swal.fire("Error", "Uppload company Image", "error");
        }
        
        if(!companyDoc ){
            return Swal.fire("Error", "Uppload Comapny Document", "error");
        }
  
        if(!state || state === "Select State"){
            return Swal.fire("Error", "Select State", "error");
        }
        
        formData.append("desc", desc);
        formData.append("cname", cname);
        formData.append("owner", owner);
        formData.append("phone", phone);
        formData.append("email", email);
        formData.append("state", state);
        formData.append("owner", owner);
        formData.append("website", website);
        formData.append("rnumber", rnumber);
        formData.append("address", address);
        formData.append("logo", logoImage);
        formData.append("companyDoc", companyDoc);
        

        $.ajax({
            method: "POST",
            url: "/customer/company/",
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
                        location.replace('/customer/company-views/')
                      }
                    });

                    // resete the form 
                    $("#re_form")[0].reset()
                   
                  } else {
                    Swal.fire("Error", response.Message, "error");
                  }
            },
            error: function(error){
                // handle error 
                console.log(error)

            }
        })

      
            
    })
})