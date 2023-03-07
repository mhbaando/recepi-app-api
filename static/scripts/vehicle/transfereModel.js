$(document).ready(()=>{


const overlay = $(".overlay")
    const modal = $(".model-contaier")
    const cancle = $(".cancle-btn")

    $("#transferbtn").on("click", function(){
        overlay.attr("class","overlay")
        modal.attr("class","model-contaier")
    })

    overlay.on("click", function(){
        overlay.attr("class","hidden")
        modal.attr("class","hidden")
    })
    cancle.on('click',function(){
        overlay.attr('class', 'hidden')
        modal.attr('class','hidden')
    })


    let transfer_document = ""
        $('#doc').change(function(){
            const file = this.files[0];
            if (file){
                transfer_document = file
            }else{
                transfer_document= undefined
            }
        })

let vehicleID = ""
 const transfer_btn = document.querySelectorAll("#transferbtn")
    // loop over the node list
    transfer_btn.forEach(btn => {
        btn.addEventListener('click', function(){
            vehicleID = $(this).data('vehicleid')
            overlay.attr('class', 'overlay')
            modal.attr('class','model-contaier')
        })
    });

  $("#DataNumber").val($("#DataNumber").attr("DataNumber"));

  $("#DataNumber").change(function () {
    RefreshPage();
  });
  

  const ownar_name = $("#ownar_name")
  const owner_mother = $("#owner_mother")
  const old_hid_idd = $("#old_hid_id")
  const receipt_number=$("#receipt_number")
  const new_hid_id = $("#new_hid_id")
 
  // const doc = $("#doc")
  


  // new owner


  // event on input 
  // find old owner
  $("#rv_num").on('input',function(){
    const value = $(this).val() 
    // check if it's not empy and have more then 4 chars
    if (value.trim().length && value.trim().length >= 4 ){
      // request to the backeend 
      $.ajax({
        type: 'GET',
        url: '/vehicles/transfer-search/'+value,
        async: false,
        headers: { "X-CSRFToken": csrftoken },
        success: function (data) {
          ownar_name.attr('value', `${data.owner_name} - ${data.personal_id}`)
          owner_mother.attr('value', data.mother_name)
          old_hid_idd.attr('value', data?.old_hid_id)
          receipt_number.attr('value', data?.receipt_number)
      
        },
        error: function(err){
          alert(err);
        }
    })
  }else{
    // reste when chars are lesthe 4 charsd
    ownar_name.attr('value', "")
    owner_mother.attr('value', "")
  }
})





  // find new owner
  



  // select new owner
  
  let customer = ""
  $("input[name='Typelist']").on('input', function(e){
    customer= $(this).val().split("-")[1]?.trim();  
    $.ajax({
      type: 'GET',
      url: '/vehicles/transfer-searchh/'+customer,
      async: false,
      headers: { "X-CSRFToken": csrftoken },
      success: function (data) {
        newOwnerMother.attr('value', data.newownermother_name)
        phone.attr('value', data.phone)
        new_owner_id.attr('value', data.new_owner_id)

      },
      error:function(err){
        alert(err);
      }
      
  })
    
  })

  
  function findOwner (name){
    let owner = []
    $.ajax({
        method: "GET",
        url: "/vehicles/searchcustomer/" + name,
        async: false,
        headers: { "X-CSRFToken": csrftoken },
        success: function (data) {
          if (!data.isError) {
          owner = data.Message
            
         
          } else {
            Swal.fire( data.title, data.Message,  data.type);
          }
        },
        error: function (error) {
          error;
        },
      });
      return owner
}

$("#search").on("input", function (){
    if ($(this).val().trim().length > 4 ){
        const owner =  findOwner($(this).val())
        const newOwnerMother = $("#newownermother_name")
        const personal_id = $("#personalid")
       
        console.log($(this).val());
        $("#search").autocomplete({
            source: owner,
            select: function (event, ui) {
              const item = ui.item.rv_id;
              const value = ui.item.value;
              if (value != "") {
                $("#search").attr("rv_id", item);
                personal_id.attr('value', ui.item.personal_id)
                newOwnerMother.attr('value', ui.item.newowner_mother_name)
                new_hid_id.attr('value', ui.item.new_hid_id)
              }
  
            },
            response: function (event, ui) {
              if (!ui.content.length) {
                var noResult = { value: "", label: "No result found" };
                ui.content.push(noResult);
              }
            },
            minLength: 1,
          });

        // newOwnerMother.attr('value', newownermother_namenewownermother_name)
        // phone.attr('value', phone.phone)
     
    }
})



 

  

  
  // submit form
  $('#transfer_form').on('submit',function(e){
    e.preventDefault();
    const newOwnerMother = $("#owner_mother")
    // const doc=$("#doc")
    const reason = $("#reason")
    const description = $("#description")
    let formData = new FormData();
          
    formData.append("reason",reason.val());
    formData.append("description",description.val());
    formData.append("transfer_document",transfer_document);
    formData.append("olold_hid_id",old_hid_idd.val());
    formData.append("receipt_number",receipt_number.val());
    formData.append("new_hid_id",new_hid_id.val());
    formData.append("vehicleID",vehicleID);

    if(!transfer_document || transfer_document === "Select a document" ){
      return Swal.fire("Error", "Select A document ", "error");
  }


    
    $.ajax({
  method: "POST",
  url: "/vehicles/register-tranfer/",
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

