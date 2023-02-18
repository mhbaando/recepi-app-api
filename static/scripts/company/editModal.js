$(document).ready(()=>{
    const overlay = $(".overlay")
    const modal = $(".model-contaier")
    let companyID ;
    // show model on click
    $(".edit").on('click', function(){
        overlay.attr('class', 'overlay')
        modal.attr('class','model-contaier')
        companyID = $(this).data('company')
        

        // prepapulate data to the model
        // 1. get the selected compnay
        // $.ajax({
        //     method: "GET",
        //     url: `/customer/findcompany/${companyID}`,
        //     headers: { "X-CSRFToken": csrftoken },
        //     async: true,
        //     success: function(response){
        //         if (!response.isError) {
        //            response.Message.forEach(company => {
        //             //2. fill data to the html ellemets
        //             $("#cname").attr('value', company. company_name)
        //             $("#website").attr('value',  company.website)
        //             $("#address").attr('value', company.address)
        //             $("#rnumber").attr('value',  company.reg_no )
        //             $(`#state option[value='${ company.federal_state_id}']`).attr('selected', true)

        //            });
        //           } else {
        //             Swal.fire("Error", response.Message, "error");
        //           }
        //     },
        //     error: function(error){
        //         Swal.fire("Error", error.responseText, "error");
        //     }
        // })
        console.log(companyID)
    })

    // hide modal on click
    overlay.on('click', function(){
        overlay.attr('class', 'hidden')
        modal.attr('class','hidden')
    })
   

    let state = ""
    $("#state").on("change",()=>{
        state = $("#state option:selected").val()
    })

   
  

    // submit
    $("#update_form").on('submit', function(e){
        e.preventDefault()
     
     let formData = new FormData(this);
     const  company_name = $("#cname").val().trim().split(" ")
     const website = $("#website").val()
     const address = $("#address").val()
     const reg_no  = $("#rnumber").val()
    

    
    //  check if no change in state, nation, blooad group 
  
        state = $("#state option:selected").val()
       
    // if(company_name.length < 4 || company_name.length > 4){
    //     return Swal.fire("Error", 'Name can be only 4 names', "error");
    // }

    const cname =  company_name[0]
    // const m_name = company_name[1]
    // const t_name = company_name[2]
    // const fo_name = company_name[3]

   
    formData.append("companyname", cname);
    formData.append("full_name", company_name.join(" "));
    formData.append("address", address);
    formData.append("website", website);
    formData.append("regno", reg_no);
    formData.append("state", state);
   
  
    formData.append("company_id", companyID);

     $.ajax({
        method: "POST",
        url: `/customer/updatecompany/`,
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