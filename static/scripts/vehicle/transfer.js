$(document).ready(function () {
  // Update The Entries Selection
  let transfare_document = ""
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

  $(".pagination .page-item").on("click", function () {
    const pageNumber = $(this).attr("page");
    $(".activePage").attr("activePage", pageNumber);
    RefreshPage();
  });
  function RefreshPage() {
    let page = $(".activePage").attr("activePage");
    let search = $("#SearchQuery").val();
    let entries = $("#DataNumber").val();

    let url = `/vehicles/register-tranfer?DataNumber=${entries}&page=${page}`;

    if (search != "") {
      url += `&SearchQuery=${search}`;
    }

    window.location.replace(url);
  }
});

// beginning
$("#doc").on('change', function(){
  const file = this.files[0]
  if(file){
    transfare_document = file
  }else {
    transfare_document = undefined
  }
})

//old owner id
const rv_number = $("#rv_num")

const owner_name = $("#ownar_name")
const ownar_mother = $("#ownar_mother")
const personalID = $("#personalID")
const old_vehicle_idd = $("#old_vehicle_id")

//new owner_name
const new_number = $("#newowner_number")

const newownermother_name = $("#newownermother_name")
const new_owner_id = $("#new_owner_id")

const old_hid_idd = $("#old_hid_id")
const new_hid_id = $("#new_hid_id")
const reason = $("#reason")
const description = $("#description")







/// rv search
$(document).ready(function () {
rv_number.on("input",function(){
  rv_num = rv_number.val()
  if(rv_num.trim().length && rv_num.trim().length >=4){
    $.ajax({
      type: 'GET',
      url: '/vehicles/transfer-search/'+rv_num,
      async: false,
      headers: { "X-CSRFToken": csrftoken },
      success: function (data) {
        owner_name.attr('value',data?.owner_name)
        ownar_mother.attr('value', data?.mother_name)
        personalID.attr('value', data?.personal_id)
        old_hid_idd.attr('value', data?.old_hid_id)
        old_vehicle_idd.attr('value', data?.old_vehicle_id)
        
        
      },
      
      error:function(err){

      }
    });
    
  }

  
  

})




}) 

$(document).ready(function () {
new_number.on("input",function(){
  newowner_num = new_number.val()
    if(newowner_num.trim().length && newowner_num.trim().length >=4){
      $.ajax({
        type: 'GET',
        url: '/vehicles/transfer-searchh/'+newowner_num,
        async: false,
        headers: { "X-CSRFToken": csrftoken },
        success: function (data) {
          newownermother_name.attr('value', data?.newownermother_name)
          new_owner_id.attr('value', data?.new_owner_id)
          new_hid_id.attr('value', data?.new_hid_id)
        },
        error:function(err){
        }
      });
    }
  });
})

let formData = new FormData();
      
formData.append("reason",reason.val());
formData.append("description",description.val());
formData.append("doc",transfare_document);
formData.append("new_hid_id",new_hid_id.val());
formData.append("olold_hid_id",old_hid_idd.val());
formData.append("old_vehicle_id",old_vehicle_id.val());

$("#reg_form").on('submit',function(e){
  e.preventDefault();


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
