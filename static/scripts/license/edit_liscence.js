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




   