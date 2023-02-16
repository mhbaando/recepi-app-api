$(document).ready(function () {
  
  let vehicleId = ""
  const ownar_name = $("#owner_info")
  const hidden= $("#veh_hid_id")
  let number=$("#number")
  const vhbtns = document.querySelectorAll("#vehicle_id")
  vhbtns.forEach(btn=>{
    btn.addEventListener("click",function(){
      vehicleId = $(this).data('vehicleid')
 
      fetch('/vehicles/vehicle_info/'+vehicleId,{
        method: 'GET',
        headers: { "X-CSRFToken": csrftoken },
      }).then(res=> res.json()).then(data=>{
        // succes
        ownar_name.attr('value', `${data.vehicle_model} - ${data.owner}`)
        number.attr('value',`${(data.number + 1 ).toString().padStart(4, '0')}`)

      }).catch(err=>{
        // handler error
      })
  })
})
 




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
// request to the backend getting the selected code, type,state 

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
    let year = ""
    $("#year").on("change",()=>{
        year = $("#year option:selected").val()
    })

 
  

   


    $('#reg_form').on('submit',function(e){
      e.preventDefault();
      let formData = new FormData();
            
      formData.append("type",type);
      formData.append("code",code);
      formData.append("state",state);
      formData.append("number",number.val());
      formData.append("vehicleId",vehicleId);
      formData.append("year",year);
      
  
    
  
     
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
    





  })