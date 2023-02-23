$(document).ready(function (){


})



$("#reciet_form").on('submit',function(e){
  e.preventDefault();

  const rvid = $("#rvnumber").val();
  const rcfrom = $("#search1").atrr("account_name");
  const rvaccount = $("#search1").attr("account_number");
  const persid = $("personal_id").attr("personal_id");
  const rvamount = $("#rv_amount").attr("amount");
  const mothername = $("#mother_name").val();


  let formData = new formData();

  formData.append("rvnumber",rvid);
  formData.append("search1",rcfrom);
  formData.append("search1",rvaccount);
  formData.append("personal_id",persid)
  formData.append("rv_amount",rvamount);
  formData.append("mother_name",mothername)

})

$.ajax({
  method: "POST",
  url: "/finance/add_receipt/",
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
              location.replace('/finance/receipt/')
            }
          });

          // resete the form 
          $("#re_form")[0].reset()
         
        } else {
          Swal.fire("Error", response.Message, "error");
        }
  },
  error: function(error){
      // handle error 
      console.log(error)

  }
})

// find recieved from


function findrcfrom(name){
  let rcfrom = []
  $.ajax({
    method:"GET",
    url:"/Finance/searchrvaccount/" + name,
    async:false,
    headers:{"X-CSRFToken": csrftoken},
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
  return rcfrom

  
}
$("#search").on("input",function(){


  if ($(this).val().trim().length > 4){
    const rcfrom = findrcfrom($(this).val())
    $("#search").autocomplete({
      source:rcfrom,
      select : function (event,ui){
        const item = ui.item.account_name;
        const value = ui.item.value;
        if (value != ""){
          $("#search").attr("rv_id",item);
          account_id = ui.item.account_pk
          console.log(ui.item.account_pk)

        }
      },

      response:function(event,ui){
        if (!ui.content.length){
          var noResult = {value: "" , label:"No result found"};
          ui.content.push(noResult);

        }
      },
      minlength : 1,
    });
  }
})


// search rv amount and recieved from

function findrvAccount(id){
  let rvaccount = []
  $.ajax({
    method:"GET",
    url:"/Finance/searchrvaccount/" + id,
    async:false,
    headers:{"X-CSRFToken": csrftoken},
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
  return rvaccount

  
}

$("#search1").on("input",function(){


  if ($(this).val().trim().length > 4){
    const rvaccount = findrvAccount($(this).val())
    $("#search1").autocomplete({
      source:rvaccount,
      select : function (event,ui){
        const item = ui.item.account_number;
        const value = ui.item.value;
        if (value != ""){
          $("#search1").attr("rv_id",item);
          account_id = ui.item.account_pk
          console.log(ui.item.account_pk)

        }
      },

      response:function(event,ui){
        if (!ui.content.length){
          var noResult = {value: "" , label:"No result found"};
          ui.content.push(noResult);

        }
      },
      minlength : 1,
    });
  }
})


// function rv(id){
//   $.ajax({
//     method: "GET",
//     url: "/Finance/customer_info/" + name,
//     async: false,
//     headers: { "X-CSRFToken": csrftoken },
//     success: function (data) {
//       if (!data.isError) {
//         $("#ownar_name").val(data.Message.ownar_name);
        
//      console.log(data)
//       } else {
//         Swal.fire( data.title, data.Message,  data.type);
//       }
//     },
//     error: function (error) {
//       error;
//     },
//   });
// }




// another



 // Performing autocomplete function
 $("#search").on("input", function () {
   
  $("#rv_account").val("");
  $("#personal_id").val("");

  $("#mother_name").val("");
  
  
  var listUsers = [];
  if ($(this).val() != "" && $(this).val().length > 2) {
    listUsers = Receiptvoucher($(this).val());
    $("#search").autocomplete({
      source: listUsers,
      select: function (event, ui) {
        const item = ui.item.rv_id;
        const value = ui.item.value;
        if (value != "") {
          $("#search").attr("rv_id", item);
          customer(item);
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
  }
});

function Receiptvoucher(id) {
  var list = [];
  $.ajax({
    method: "GET",
    url: "/finance/receipt_voucher/" + id,
    async: false,
    headers: { "X-CSRFToken": csrftoken },
    success: function (data) {
      data.Message.forEach((receipt_voucher) => {
        list.push(receipt_voucher);
      });
    },
  });

  return list;
}












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

  $(".pagination .page-item").on("click", function () {
    const pageNumber = $(this).attr("page");
    $(".activePage").attr("activePage", pageNumber);
    RefreshPage();
  });

  function RefreshPage() {
    let page = $(".activePage").attr("activePage");
    let search = $("#SearchQuery").val();
    let entries = $("#DataNumber").val();

    let url = `/finance/accounts?DataNumber=${entries}&page=${page}`;

    if (search != "") {
      url += `&SearchQuery=${search}`;
    }

    window.location.replace(url);
  }

