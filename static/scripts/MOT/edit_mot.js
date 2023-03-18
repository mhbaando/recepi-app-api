$(document).ready(()=>{
    let testID=""
    const overlay = $(".overlay-code")
    const modal = $(".containerr_code")
    const cancle = $(".Close-btn")

    $("#edittests").on("click", function(){
        overlay.attr("class","overlay-code")
        modal.attr("class","containerr_code")
        testID = $(this).data('test')
      
    
    })

    overlay.on("click", function(){
        overlay.attr("class","hidden")
        modal.attr("class","hidden")
    })
    cancle.on('click',function(){
        overlay.attr('class', 'hidden')
        modal.attr('class','hidden')
    })
  
    $.ajax({
        method: "GET",
        url: `/vehicles/find_test/${testID}`,
        headers: { "X-CSRFToken": csrftoken },
        async: true,
        success: function (response) {
            if (!response.isError) {
                response.Message.forEach(test => {
                    // 2. fill data to the html ellemets
                    $("#meter").attr('value', test.meter)
                    console.log(test.meter);

                });
            } else {
                Swal.fire("Error", response.Message, "error");
            }
        },
        error: function (error) {
            Swal.fire("Error", error.responseText, "error");
        }
    })
 


})
 