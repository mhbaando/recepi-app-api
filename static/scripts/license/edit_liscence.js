$(document).ready(()=>{
    let license_ID = ""


    const overlay = $(".overlay")
        const modal = $(".model-contaier")
        const cancle = $(".Close-btn")
    
        $("#edit_liscence").on("click", function(){
            overlay.attr("class","overlay")
            modal.attr("class","model-contaier")
        })
    
        overlay.on("click", function(){
            overlay.attr("class","hidden")
            modal.attr("class","hidden")
        })
        cancle.on('click',function(){
            overlay.attr('class', 'hidden')
            modal.attr('class','hidden')
        })



 const liscence_btn = document.querySelectorAll("#edit_liscence")
    // loop over the node list
    liscence_btn.forEach(btn => {
        btn.addEventListener('click', function(){
            license_ID = $(this).data('liscence')
            overlay.attr('class', 'overlay')
            modal.attr('class','model-contaier')
            console.log();

        console.log(license_ID);
            
            $.ajax({
                method: "GET",
                url: `/customer/find_liscence/${license_ID}`,
                headers: { "X-CSRFToken": csrftoken },
                async: true,
                success: function(response){
                    if (!response.isError) {
                       response.Message.forEach(liscence => {
                        // 2. fill data to the html ellemets
                        $("#reg_number").attr('value', liscence.reg_no)
                        $("#r_number").attr('value', liscence.receipt_voucher_id)
                        $("#exp_date").attr('value', liscence.expired_date)
                        $("#reg_date").attr('value', liscence.created_at)
                        $("#owner_lis").attr('value', liscence.owner_id)
                        $(`#state option[value='${liscence.federal_state_id}']`).attr('selected', true)
                        $(`#type option[value='${liscence.type_id}']`).attr('selected', true)
                        $(`#place option[value='${liscence.place_of_issue_id}']`).attr('selected', true)
                        // liscence.status === 'Active' ? $("#status input[value='Active']").attr('checked',true) : liscence.status === 'Lost' ? $("#status input[value='Lost']").attr('checked',true) : liscence.status === 'Expired' ?  $("#status input[value='Expired']").attr('checked',true) : $("#status input[value='Suspended']").attr('checked',true)  
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

        let state = ""
        $("#state").on('click',function(){
            state =  $(this).val()
        })
        let type = ""
        $("#type").on('click',function(){
            type =  $(this).val()
        })

        let place = ""
        $("#place").on('click',function(){
            place =  $(this).val()
        })
        let state_r = ""
        $(".state_r input[type='radio']").on('click',function(){
            state_r =  $(this).val();
        })
        
      
        // submit
        $("#update_form").on('submit', function(e){
            e.preventDefault()
         
         let formData = new FormData(this);
       
         const reg_number = $("#reg_number").val()
         const r_number = $("#r_number").val()
         const exp_date = $("#exp_date").val()
         const reg_date = $("#reg_date").val()
         const owner_lis = $("#owner_lis").val()
      
        
         //  check if no change happens
         if (state.trim().length <= 0 || type.trim().length <= 0 || place.trim().length <=0 ){
            state= $("#state option:selected").val()
            place = $("#place option:selected").val()
            type = $("#type option:selected").val()
            status_r = $("#gender input[type='radio']:checked").val()
           
        }
      
       
        formData.append("reg_number", reg_number);
        formData.append("r_number", r_number);
        formData.append("exp_date", exp_date);
        formData.append("reg_date", reg_date);
        formData.append("state", state);
        formData.append("place", place);
        formData.append("type", type);
        formData.append("owner_lis", owner_lis);
        formData.append("status_r", status_r);
        formData.append("license_ID", license_ID);
     $.ajax({
            method: "POST",
            url: `/customer/edit_liscence/${license_ID}`,
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
    })




   