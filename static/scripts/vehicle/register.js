$(document).ready(function () {
  
   let model_brand =""
    $("#model_brand").on("change",()=>{
        model_brand = $("#model_brand option:selected").val()
    })

    let color = ""
    $("#color").on("change",()=>{
        color= $("#color option:selected").val()
    })

    let year = ""
    $("#year").on("change",()=>{
        year = $("#year option:selected").val()
    })

    let origin = ""
    $("#origin").on("change",()=>{
        origin = $("#origin option:selected").val()
    })

    let cylinders = ""
    $("#cylinders").on("change",()=>{
        cylinders = $("#cylinders option:selected").val()
    })

    const rv_number = $("#rv_num")
    const owner_id = $("#owner_id")
    const owner_name = $("#ownar_name")
    const ownar_mother = $("#ownar_mother")
    const personalID = $("#personalID")
    
    
    
    rv_number.on("input",function(){
      rv_num = rv_number.val()
      if(rv_num.trim().length && rv_num.trim().length >=4){
        $.ajax({
          type: 'GET',
          url: '/vehicles/owner-search/'+rv_num,
          async: false,
          headers: { "X-CSRFToken": csrftoken },
          success: function (data) {
            owner_name.attr('value',data?.owner_name)
            ownar_mother.attr('value', data?.mother_name)
            personalID.attr('value', data?.personal_id)
            owner_id.attr('value', data?.owner_id)
          },
          
          error:function(err){

          }
        });
        
      }
      else{
        // reste when chars are lesthe 4 charsd
        ownar_name.attr('value', "")
        owner_mother.attr('value', "")
        personalID.attr('value', "")
      
      }
    })
    
    $("#reg_form").on('submit',function(e){
        e.preventDefault();
        
        const hp = $("#hp").val();
        const owner = owner_id.val()
        const rv_num = rv_number.val()
        const weight = $("#weight").val();
        const engine_number= $("#engine_number").val()
        const  passenger_seats= $("#passenger_seats").val();
        const registration_number = $("#registration_number").val();
        let formData = new FormData();
        
        formData.append("weight", weight);
        formData.append("hp",hp);
        formData.append("passenger_seats", passenger_seats);
        formData.append("registration_number", registration_number);
        formData.append("engine_number", engine_number);
        formData.append("year", year);
        formData.append("color", color);
        formData.append("model_brand", model_brand);
        formData.append("origin", origin);
        formData.append("cylinders", cylinders);
        formData.append('owner_id', owner)
        formData.append('rv_num', rv_num)


      if(!model_brand || model_brand === "Select a Model brand"){
          return Swal.fire("Error", "Select A Model_brand", "error");
      }
      
      if(!year || year === "Select a year" ){
        return Swal.fire("Error", "Select A Year ", "error");
    }


       
       if(!origin || origin === "Select Origin"){
        return Swal.fire("Error", "Select A Origin", "error");
    }
     
       
       if(!color || color === "Select a Color"){
           return Swal.fire("Error", "Select A color", "error");
       }

     
      if(!cylinders || cylinders === "Select A Cylender"){
           return Swal.fire("Error", "Select A cylinder", "error");
      }
        
      $.ajax({
          method: "POST",
          url: "/vehicles/registervehicle",
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
                      location.replace('/vehicles/viewvehicle')
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