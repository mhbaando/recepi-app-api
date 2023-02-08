$(document).ready(function () {
    // get user image and uppload doc
    let customerImage = ""
    let customerDoc = ""
    $('#upload').change(function(){
        const file = this.files[0];
        if (file){
            customerImage = file
        }else{
            customerImage = undefined
        }
    })

    $("#doc").on('change', function(){
        const file = this.files[0]
        if(file){
            customerDoc = file
        }else {
            customerDoc = undefined
        }
    })


    // set date of birth today
    // determain the max date
    const year =String(new Date().getFullYear())
    // make it 2 digits both month and day
    const month = String(new Date().getMonth() + 1).padStart(2, '0');
    const today = String(new Date().getDate()).padStart(2, '0');
    const formattedDate = `${year}-${month}-${today}` 
    const dob = $("#dob")
    dob.attr('max',formattedDate)
    dob.attr('value',formattedDate)
     
    // get gender data
    let gender = ""
    $(".gender input[type='radio']").on('click',function(){
        gender =  $(this).val();
    })

    // get bload group choice
    let group = ""
    $("#bload_group").on("change",()=>{
        group = $("#bload_group option:selected").val()
    })


    // get nation
    let nation =""
    $("#nation").on("change",()=>{
        nation = $("#nation option:selected").val()
    })

    // get state 
    let state = ""
    $("#state").on("change",()=>{
        state = $("#state option:selected").val()
    })


    // get passport
    let docType = ""
    $("#doctype").on("change",()=>{
        docType = $("#doctype option:selected").val()
    })
    $("#reg_form").on('submit',function(e){
        e.preventDefault();
        let formData = new FormData(this);

        const fName = $("#fname").val();
        const sName = $("#sname").val();
        const thName = $("#thname").val();
        const foName = $("#foname").val();
        const mName = $("#mname").val()
        const phone = $("#phone").val()
        const email = $("#email").val()
        const address = $("#address").val()
        const personalID = $("#perid").val()

        // check data integrity
        if(!gender){
           return Swal.fire("Error", "Select Agender", "error");
        }
        
        if(!group || group === "Select Bload Group"){
            return Swal.fire("Error", "Select A Bload Group", "error");
        }

        if(!nation || nation === "Select a Nationality"){
            return Swal.fire("Error", "Select A Nationality", "error");
        }

        if(!customerImage ){
            return Swal.fire("Error", "Uppload Customer Image", "error");
        }
        
        if(!customerDoc ){
            return Swal.fire("Error", "Uppload Identity Document", "error");
        }

        if(!docType || docType === "Select Type" ){
            return Swal.fire("Error", "Select Identity Document", "error");
        }

        if(!state || state === "Select State"){
            return Swal.fire("Error", "Select State", "error");
        }
        
        formData.append("fname", fName);
        formData.append("sname", sName);
        formData.append("thname", thName);
        formData.append("foname", foName);
        formData.append("mname", mName);
        formData.append("dob", dob.val());
        formData.append("gender", gender);
        formData.append("bload_group", group);
        formData.append("nationality", nation);
        formData.append("phone", phone);
        formData.append("email", email);
        formData.append("address", address);
        formData.append("state", state);
        formData.append("perid", personalID);
        formData.append("img", customerImage);
        formData.append("docType", docType);
        formData.append("customerDoc", customerDoc);
        

        $.ajax({
            method: "POST",
            url: "/customer/",
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
                        location.replace('/customer/list')
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