$(document).ready(function () {
    // get gender data
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

    
    $("#reg_form").on('submit',function(e){
        e.preventDefault();
        let formData = new FormData(this);

        const Hp = $("#hp").val();
        const Weight = $("#weight").val();
        const registration_number = $("#registration_number").val();
        const  passenger_seats= $("#passenger_seats").val();
        const engine_number= $("#engine_number").val()
        
        formData.append("hp", Hp);
        formData.append("weight", Weight);
        formData.append("registration_number", registration_number);
        formData.append("passenger_seats", passenger_seats);
        formData.append("engine_number", engine_number);
        formData.append("weight", weight);
        formData.append("model_brand", model_brand);
        formData.append("color",color );
        formData.append("year", year);
        formData.append("cylinders", cylinders);
        

        $(document).on('submit', 'form', function (e) {
            e.preventDefault();
            var formData = new FormData(this);
          
            $.ajax({
              type: 'POST',
              url: '/vehicles/',
              data: formData,
              cache: false,
              contentType: false,
              processData: false, 
              success: function (data) {
                if (data == 1) {
                  debugger;
                } else {
                  debugger;
                }
              }
            });
          })

        })




  
    // let model_brand =""
    // $("#model_brand").on("change",()=>{
    //     model_brand = $("#model_brand option:selected").val()
    // })

    
    // let color = ""
    // $("#color").on("change",()=>{
    //     color= $("#color option:selected").val()
    // })
    // let year = ""
    // $("#year").on("change",()=>{
    //     year = $("#color option:selected").val()
    // })
    // let origin = ""
    // $("#origin").on("change",()=>{
    //     origin = $("#color option:selected").val()
    // })
    // let cylinders = ""
    // $("#cylinders").on("change",()=>{
    //     origin = $("#cylinders option:selected").val()
    // })

    // $("#reg_form").on('submit',function(e){
    //     e.preventDefault();
    //     let formData = new FormData(this);

    //     const hp = $("#hp").val();
    //     const weight = $("#weight").val();
    //     const registration_number = $("#registration_number").val();
    //     const  passenger_seats= $("#passenger_seats").val();
    //     const engine_number= $("#engine_number").val()
 

        // // check data integrity
        // if(!gender){
        //    return Swal.fire("Error", "Select Agender", "error");
        // }
        
        // if(!group || group === "Select Bload Group"){
        //     return Swal.fire("Error", "Select A Bload Group", "error");
        // }

        // if(!nation || nation === "Select a Nationality"){
        //     return Swal.fire("Error", "Select A Nationality", "error");
        // }

        // if(!customerImage ){
        //     return Swal.fire("Error", "Uppload Customer Image", "error");
        // }
        
        // if(!customerDoc ){
        //     return Swal.fire("Error", "Uppload Identity Document", "error");
        // }

        // if(!docType || docType === "Select Type" ){
        //     return Swal.fire("Error", "Select Identity Document", "error");
        // }

        // if(!state || state === "Select State"){
        //     return Swal.fire("Error", "Select State", "error");
        // }
        
//         formData.append("model_brand", model_brand);
//         formData.append("color", color);
//         formData.append("origin", origin);
//         formData.append("cylinder", cylinders);
//         formData.append("year", year);
//         formData.append("hp", hp);
//         formData.append("weight", weight);
//         formData.append("registration_number", registration_number);
//         formData.append("passenger_seats", passenger_seats);
//         formData.append("engine_number", engine_number);


//         $.ajax({
//             method: "POST",
//             url: "/vehicles/",
//             headers: { "X-CSRFToken": csrftoken },
//             processData: false,
//             contentType: false,
//             data: formData,
//             async: true,
//             success: function(response){
//                 if (!response.isError) {
//                     Swal.fire({
//                       title: "Success",
//                       text: response.Message,
//                       icon: "success",
//                       confirmButtonText: "Ok",
//                       confirmButtonClass: "btn btn-success mt-2",
//                       buttonsStyling: !1,
//                     }).then(function (e) {
//                       if (e.value) {
//                         Swal.DismissReason.cancel;
//                         // location.replace('/customer/list')
//                       }
//                     });

//                     // resete the form 
//                     $("#reg_form")[0].reset()
                   
//                   } else {
//                     Swal.fire("Error", response.Message, "error");
//                   }
//             },
//             error: function(error){
//                 // handle error 
//                 console.log(error)

//             }
//         })

      
            
//     })
// }
