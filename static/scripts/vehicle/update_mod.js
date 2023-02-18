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
                  $("#hp").attr('value', weight.hp)
                  $("#passenger_seats").attr('value', vehicle.passenger_seats)

                
                 
                  $("#registration_number").attr('value', vehicle.registration_number)
                  // $(`#nation option[value='${customer.nationality_id}']`).attr('selected', true)
                  // $(`#bload_group option[value='${customer.blood_group_id}']`).attr('selected', true)


                  // $("#email").attr('value', customer.email)
                  // $("#phone").attr('value', customer.phone)
                  // $("#address").attr('value', customer.address)
                  // $(`#state option[value='${customer.federal_state_id}']`).attr('selected', true)

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
 

  // let gender = ""
  // $("#gender input[type='radio']").on('click',function(){
  //     gender =  $(this).val();
  // })

  // let state = ""
  // $("#state").on("change",()=>{
  //     state = $("#state option:selected").val()
  // })

  // let nation =""
  // $("#nation").on("change",()=>{
  //     nation = $("#nation option:selected").val()
  // })

  // let group = ""
  // $("#bload_group").on("change",()=>{
  //     group = $("#bload_group option:selected").val()
  // })

  // // DOB
  // let dob = ""
  // $("#dob").on('click',function(){
  //     dob =  $(this).val()
  // })


  // // submit
  // $("#update_form").on('submit', function(e){
  //     e.preventDefault()
   
  //  let formData = new FormData(this);
  //  const full_name = $("#fname").val().trim().split(" ")
  //  const personal_id = $("#personalid").val()
  //  const email = $("#email").val()
  //  const address = $("#address").val()
  //  const phone = $("#phone").val()
  //  const mother_name = $("#mname").val()

  
  // //  check if no change in state, nation, blooad group 
  // if (gender.trim().length <= 0 || state.trim().length <= 0 || group.trim().length <=0 || nation.trim().length <= 0 || dob.trim().length <= 0 ){
  //     gender = $("#gender input[type='radio']:checked").val()
  //     state = $("#state option:selected").val()
  //     nation = $("#nation option:selected").val()
  //     group = $("#bload_group option:selected").val()
  //     dob = $("#dob").val()
  // }

  // if(full_name.length < 4 || full_name.length > 4){
  //     return Swal.fire("Error", 'Name can be only 4 names', "error");
  // }

  // const f_name =  full_name[0]
  // const m_name = full_name[1]
  // const t_name = full_name[2]
  // const fo_name = full_name[3]

 
  // formData.append("fname", f_name);
  // formData.append("sname", m_name);
  // formData.append("thname", t_name);
  // formData.append("foname", fo_name);
  // formData.append("full_name", full_name.join(" "));
  // formData.append("mname", mother_name);
  // formData.append("dob", dob);
  // formData.append("gender", gender);
  // formData.append("bload_group", group);
  // formData.append("nationality", nation);
  // formData.append("phone", phone);
  // formData.append("email", email);
  // formData.append("address", address);
  // formData.append("state", state);
  // formData.append("perid", personal_id);
  // formData.append("customer_id", customerID);

  //  $.ajax({
  //     method: "POST",
  //     url: `/customer/updatecustomer/`,
  //     headers: { "X-CSRFToken": csrftoken },
  //     processData: false,
  //     contentType: false,
  //     data :formData,
  //     async: true,
  //     success: function(response){
  //         if (!response.isError) {
  //             Swal.fire({
  //                 title: "Success",
  //                 text: response.Message,
  //                 icon: "success",
  //                 confirmButtonText: "Ok",
  //                 confirmButtonClass: "btn btn-success mt-2",
  //                 buttonsStyling: !1,
  //               }).then(function (e) {
  //                 if (e.value) {
  //                   Swal.DismissReason.cancel;
  //                   location.reload()
  //                 }
  //               });
          
  //           } else {
  //             Swal.fire("Error", response.Message, "error");
  //           }
  //     },
  //     error: function(error){
  //         Swal.fire("Error", error.responseText, "error");
  //     }
  // })
  // })
})