$(document).ready(function () { 
  $("#doc").on("change",function(){
  let file = this.files[0]
  if(file){
    $("#doc-name").text(file.name)
  }
})
  // Update The Entries Selection
  $("#DataNumber").val($("#DataNumber").attr("DataNumber"));

  $("#DataNumber").change(function () {
    RefreshPage();
  });

  $("#SearchQuery").on("change", function () {
    RefreshPage();
  });

  $("#SearchQueryBTN").on("click", function () {
    RefreshPage();
  });

  $("#Status").change(function () {
      RefreshPage();
    });

  $(".pagination .page-item").on("click", function () {
    const pageNumber = $(this).attr("page");
    $(".activePage").attr("activePage", pageNumber);
    RefreshPage();
  });

  function RefreshPage() {
    let page = $(".activePage").attr("activePage");
    let search = $("#SearchQuery").val();
    let entries = $("#DataNumber").val();
    let Status = $("#Status").val();
    
    let url = `/vehicles/viewvehicle?DataNumber=${entries}&page=${page}&Status=${Status}`;

    if (search != "") {
      url += `&SearchQuery=${search}`;
    }

    window.location.replace(url);
  }

  // plate number


  let type = ""
    $("#type").on("change",()=>{
        type = $("#type option:selected").val()
    })
    let code = ""
    $("#code").on("change",()=>{
        code = $("#code option:selected").val()
    })
    let state = ""
    $("#state").on("change",()=>{
        state = $("#state option:selected").val()
    })

    

    // show model on click
    // const vreify_btn = document.querySelectorAll("#verify-btn")
    // // loop over the node list
    // vreify_btn.forEach(btn => {
    //     btn.addEventListener('click', function(){
    //         const vehicle_hid_id = $(this).data('vehicle_id')
    //         customerInfo.attr('value', selectedCustomer)
    //         overlay.attr('class', 'overlay')
    //         modal.attr('class','model-contaier')
    //     })
    // });

    $('#reg_form').on('submit',function(e){
      e.preventDefault();
      let formData = new FormData();
            
      formData.append("type",type);
      formData.append("code",code);
      formData.append("state",state);
      formData.append("number",number);
      formData.append("vehicle_hid_id",vehicle_hid_id);
    
  
     
  $.ajax({
    method: "POST",
    url: "/vehicles/viewvehicle/",
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
                // location.replace('/vehicles/register-tranfer')
              }
            });
  
            // resete the form 
            $("#reg_form")[0].reset()
           
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
    
});

