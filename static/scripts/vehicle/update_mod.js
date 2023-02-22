$(document).ready(()=>{
    const overlay = $(".overlay")
    const modal = $(".model-contaier")
    let vehicleID ;
    // show model on click
    $(".edit").on('click', function(){
        vehicleID = $(this).data('vehicle')
        overlay.attr('class', 'overlay')
        modal.attr('class','model-contaier')
  
        
  
        // prepapulate data to the model
        // 1. get the selected customer
        $.ajax({
            method: "GET",
            url: `/vehicles/findvehicle/${vehicleID}`,
            headers: { "X-CSRFToken": csrftoken },
            async: true,
            success: function(response){
                if (!response.isError) {
                   response.Message.forEach(vehicle => {
                    //2. fill data to the html ellemets
                    $("#weight").attr('value', vehicle.weight)
                    $("#hp").attr('value', vehicle.hp)
                    $("#passenger_seats").attr('value', vehicle.pessenger_seat)
                    $("#registration_number").attr('value', vehicle.rv_number)
                    $("#engine_number").attr('value', vehicle.enginer_no)
  
                    $(`#model_brand option[value='${vehicle.brand_id}']`).attr('selected', true)
                    $(`#origin option[value='${vehicle.country_id}']`).attr('selected', true)
  
                    $(`#color option[value='${vehicle.color_id}']`).attr('selected', true)
                    $(`#year option[value='${vehicle.year}']`).attr('selected', true)
  
                    $(`#cylinder option[value='${vehicle.cylinder_id}']`).attr('selected', true)
                    
                    
                    
                   console.log(vehicle.country_id);
                    
                    
  
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
  
    // hide modal on click
    overlay.on('click', function(){
        overlay.attr('class', 'hidden')
        modal.attr('class','hidden')
    })
   
  
  
  
    let years = ""
    $("#year").on("change",()=>{
        state = $("#year option:selected").val()
    })
  
    let brands =""
    $("#brand").on("change",()=>{
        brand = $("#brand option:selected").val()
    })
  
    let origin = ""
    $("#origin").on("change",()=>{
        origin = $("#origin option:selected").val()
    })
  
    
    let cylinders = ""
    $("#cylinder").on('click',function(){
        dob =  $(this).val()
    })
    
    let color = ""
    $("#color").on('click',function(){
        color =  $(this).val()
    })
  
  
    // submit
    $("#update_form").on('submit', function(e){
        e.preventDefault()
     
     let formData = new FormData(this);
   
     const weight = $("#weight").val()
     const hp = $("#hp").val()
     const passenger_seats = $("#passenger_seats").val()
     const rv_number = $("#registration_number").val()
     const enginer_no = $("#engine_number").val()
  
    
    //  check if no change in state, nation, blooad group 
    // if (weight.trim().length <= 0 || hp.trim().length <= 0 || passenger_seats.trim().length <=0 || rv_number.trim().length <= 0 || enginer_no.trim().length <= 0 ){
    //     model_brand = $("#model_brand option:selected").val()
    //     color = $("#color option:selected").val()
    //     cylinder = $("#cylinder option:selected").val()
    //     year =  $("#year option:selected").val()
    //     origin=$("#origin option:selected").val()
  
  
   
    formData.append("weight", weight);
    
    formData.append("rv_number", rv_number);
    formData.append("engine_no", enginer_no);
    formData.append("hp", hp);
    formData.append("passenger_seats", passenger_seats);
    formData.append("color", color);
    formData.append("year", years)
    formData.append("cylinder", cylinders);
    formData.append("origin", origin);
  
    formData.append("model_brand", brands);
    formData.append("vehicleID",vehicleID);
    
  
     $.ajax({
        method: "POST",
        url: `/vehicles/updatevehicle/`,
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