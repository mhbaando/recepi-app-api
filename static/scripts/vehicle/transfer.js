$(document).ready(function(){
  let transfare_document = ""
  $("#DataNumber").val($("#DataNumber").attr("DataNumber"));

  $("#DataNumber").change(function () {
    RefreshPage();
  });
  

  const ownar_name = $("#ownar_name")
  const owner_mother = $("#owner_mother")
  const old_hid_idd = $("#old_hid_id")
  const receipt_number=$("#receipt_number")


  // event on input 
  // find old owner
  $("#rv_num").on('input',function(){
    const value = $(this).val() 
    // check if it's not empy and have more then 4 chars
    if (value.trim().length && value.trim().length >= 4 ){
      // request to the backeend 
      $.ajax({
        type: 'GET',
        url: '/vehicles/getreceipt/'+value,
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
  const newOwnerName = $("#newowner_name")
  const newOwnerMother = $("#newownermother_name")
  const new_owner_id = $("#new_owner_id")
  const phone = $("#phone")
  

  // the other ones 

const reason = $("#reason")
const description = $("#description")



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

  
  
  // submit form
  $('#reg_form').on('submit',function(e){
    e.preventDefault();
    let formData = new FormData();
          
    formData.append("reason",reason);
    formData.append("description",description.val());
    formData.append("doc",transfare_document);
    formData.append("olold_hid_id",old_hid_idd.val());
    formData.append("receipt_number",receipt_number.val());
    formData.append("new_owner_id",new_owner_id.val());

    $("#transfare_document").change(function(){
      let file = this.files[0]
      if(file){
        $("#doc-name").text(file.name)
      }
    })
    
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
              location.replace('/vehicles/register-tranfer')
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

