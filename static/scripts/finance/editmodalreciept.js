$(document).ready(() => {
  

    const overlay = $(".overlay")
    const modal = $(".model-contaier")
    let rvID;
    // show model on click
    const editbtns = document.querySelectorAll("#edit")

    editbtns.forEach(btn => {
        btn.addEventListener('click', function () {
            modal.attr('class', 'model-contaier')
            overlay.attr('class', 'overlay')
            rvID = $(this).data('rvid')

            // prepapulate data to the model
            // 1. get the selected 
            $.ajax({
                method: "GET",
                url: `/finance/find_reciept/${rvID}`,
                headers: { "X-CSRFToken": csrftoken },
                async: true,
                success: function (response) {
                    if (!response.isError) {
                        $("#rvnumber").attr('value',response. rv_number )
                            $("#rcfrom").attr('value',response.rv_from)
                            $("#reason").val(response.reason)
                            $("#rvamount").attr('value',response.rv_amount)
                        
                    } else {
                        Swal.fire("Error", response.Message, "error");
                    }
                },
                error: function (error) {
                    Swal.fire("Error", error.responseText, "error");
                }
            })
        })

    })
 // Performing autocomplete function of recieved from
 $("#rcfrom").on("input",function(){

  let rfromname = [];

  if($(this).val() != "" && $(this).val().length > 3){
    rfromname = rcfrom($(this).val());
    $("#rcfrom").autocomplete({
      source:rfromname,
      select:function(event,ui){
        const item = ui.item.value;
        const value = ui.item.value;
        if (value != "") {
          $("#rcfrom").attr("rcfrom", item)
        
          
        }
      },
      response: function (event, ui) {
        if (!ui.content.length) {
          var noResult = { value: "", label: "No result found" };
          ui.content.push(noResult);
        }
      },
      minLength: 2,
    });
  }
});

    // updated receipt search

    function rcfrom(name) {
      let list = [];
      $.ajax({
        method: "GET",
        url: "/finance/findrfroms/" + name,
        async: false,
        headers: { "X-CSRFToken": csrftoken },
        success: function (data) {
          data.Message?.forEach((rfromname ) => {
            list.push(rfromname );
          });
        },
        
      });
      return list;
    }
  



    

    

  


    $("#updaterecitfrom").on('submit', function (e) {
        e.preventDefault()
        //  check if no change in state, nation, blooad group 
       
        const rvnumber= $("#rvnumber").val()
        const recievedfrom = $("#rcfrom").val().split('-')[1]
        const rreason = $("#reason").val()
        const rvamount = $("#rvamount").val()

       
        let formData = new FormData(this);
        formData.append("rvnumber", rvnumber);
        formData.append("reason", rreason);
        formData.append("amount", rvamount);
        formData.append("recievedfrom", recievedfrom);



        $.ajax({
            method: "POST",
            url: `/finance/updatereciept/${rvID}`,
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

                } else {
                    Swal.fire("Error", response.Message, "error");
                }
            },
            error: function (error) {
                Swal.fire("Error", error.responseText, "error");
            }
        })
    })
})


