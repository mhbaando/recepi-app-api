$(document).ready(()=>{


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


let liscence_ID = ""
 const liscence_btn = document.querySelectorAll("#edit_liscence")
    // loop over the node list
    liscence_btn.forEach(btn => {
        btn.addEventListener('click', function(){
            liscence_ID = $(this).data('liscence_id')
            overlay.attr('class', 'overlay')
            modal.attr('class','model-contaier')
            $.ajax({
                method: "GET",
                url: `/customer/find_liscence/${license_id}`,
                headers: { "X-CSRFToken": csrftoken },
                async: true,
                success: function(response){
                    if (!response.isError) {
                       response.Message.forEach(liscence => {
                        //2. fill data to the html ellemets
                       
                        $("#Liscence_num").attr('value', liscence)
                        
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




   