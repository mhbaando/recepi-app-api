$(document).ready(function () {
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

    

    $("#vehicle_hid_id").on('input',function(){
      const value = $(this).val() 
      // check if it's not empy and have more then 4 chars
      if (value.trim().length && value.trim().length >= 4 ){
        // request to the backeend 
        $.ajax({
          type: 'GET',
          url: '/vehicles/assignplate/'+value,
          async: false,
          headers: { "X-CSRFToken": csrftoken },
          success: function (data) {
            vehicle_hid_id.attr('value', data.vehicle_hid_id)
            
          },
          error: function(err){
            alert(err);
          }
      })
    
    }
  })

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

