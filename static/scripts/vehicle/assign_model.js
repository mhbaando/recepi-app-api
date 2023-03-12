$(document).ready(()=>{


    const overlay = $(".overlay-assign")
    const modal = $(".containerr")
    const cancle = $(".Close-btn")
       
    
    $("#assign_btn").on("click", function(){
        overlay.attr("class","overlay-assign")
        modal.attr("class","containerr")
    })

    overlay.on("click", function(){
        overlay.attr("class","hidden")
        modal.attr("class","hidden")
    })
    
    cancle.on('click',function(){
        overlay.attr('class', 'hidden')
        modal.attr('class','hidden')
    })
    let stateappre = [{
        'name':'Banaadir',
        'appreviation':'BN'
      },
      {
        'name':'Hirshabeelle',
        'appreviation':'HR'
      },
      {
        'name':'Galmudug',
        'appreviation':'GM'
      },
      {
        'name':'Puntland',
        'appreviation':'PN'
      },
      {
        'name':'Koonfur Galbeed',
        'appreviation':'KG'
      },
      {
        'name':'Jubba land',
        'appreviation':'JL'
      },
      {
        'name':'Somali land',
        'appreviation':'SL'
      }
      ]
    
      let plateNo = ""
      let vehicleIdd= ""
      let type = ""
      
      let state = "" // for form to display satateid
      let stateplate = "" // for user to display statet
      let code = ""  // for form to dispay code ID
      let codeplate = "" // for user to display code
     
     
    let year = ""
      $("#year").on("change",()=>{
          year = $("#year option:selected").val()
      })

    let code_plates = ""
      $("#code").on("change",()=>{
        code_plates = $("#code option:selected").val()
        fetch('/vehicles/vehicle_plate/' +code_plates,{
          method: 'GET',
          headers: { "X-CSRFToken": csrftoken },
        }).then(res=> res.json()).then(data=>{
         
          if (data.number === null) {
            plateNo = (1).toString().padStart(4, '0')
            number.attr('value',`${(1).toString().padStart(4, '0')}`)
          
          }
  
          plateNo = (Number(data.number) + 1 ).toString().padStart(4, '0')
          number.attr('value',`${(Number(data.number) + 1 ).toString().padStart(4, '0')}`)
        
        
         
  
        }).catch(err=>{
          // handler error
        })
            
          
  })


      
    
      
   const ownar_name = $("#owner_info")
   const hidden= $("#veh_hid_id")
let number=$("#number")
    const assign_btn = document.querySelectorAll("#assign_btn")
    assign_btn.forEach(btn=>{
    btn.addEventListener("click",function(){
        vehicleIdd= $(this).data('assignvehicleid')
        overlay.attr("class","overlay-assign")
        modal.attr("class","containerr")
      
    
          fetch('/vehicles/vehicle_info/'+vehicleIdd,{
            method: 'GET',
            headers: { "X-CSRFToken": csrftoken },
          }).then(res=> res.json()).then(data=>{
            // succes
            ownar_name.attr('value', `${data.vehicle_model} - ${data.owner}`)
    
            // if (data.number === null) {
            //   plateNo = (1).toString().padStart(4, '0')
            //   number.attr('value',`${(1).toString().padStart(4, '0')}`)
            
            // }
    
            // plateNo = (Number(data.number) + 1 ).toString().padStart(4, '0')
            // number.attr('value',`${(Number(data.number) + 1 ).toString().padStart(4, '0')}`)
          
           
    
          }).catch(err=>{
            // handler error
          })
      })
    })
     
    $("#type").on("change",()=>{
      type = $("#type option:selected").val()
      
     
    })
    
    $("#code").on("change",()=>{
      code = $("#code option:selected").val()
      codeplate=$("#code option:selected").text().trim()
      number.attr('value',`${stateplate}-${codeplate}-${plateNo}`)
    })
    
    
    $("#state").on("change",function(){
      state =  $("#state option:selected").val()
    
      const selected = $("#state option:selected").text().trim()
      stateplate = stateappre.filter(state=> state.name.includes(selected))[0].appreviation
      number.attr('value',`${stateplate}-${codeplate}-${plateNo}`)
      
    })
 
      // plate number
    // request to the backend getting the selected code, type,state 
         $('#reg_form').on('submit',function(e){
          e.preventDefault();
          let formData = new FormData();
                
          formData.append("type",type);
          formData.append("code",code);
          formData.append("state",state);
          formData.append("number",plateNo);
          formData.append("vehicleIdd",vehicleIdd);
          formData.append("year",year);
       

        if(!type || type === "Select a Type"){
            return Swal.fire("Error", "Select A Type", "error");
        }

        if(!year || year === "Select a year"){
            return Swal.fire("Error", "Select A year", "error");
        }
        if(!code || code === "Select a code"){
            return Swal.fire("Error", "Select A code", "error");
        }
        if(!state || state === "Select a state"){
            return Swal.fire("Error", "Select A State", "error");
        }
        
      
      
      $.ajax({
        method: "POST",
        url: "/vehicles/assignplate/",
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


