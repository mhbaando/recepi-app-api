$(document).ready(function () {

  let rvid = $("#rvnumber").val();
 
  let persid = $("personal_id").val();
  let rvamount = $("#rv_amount").val();
  let mothername = $("#mother_name").val();



  function rcfrom(name) {
    let list = [];
    $.ajax({
      method: "GET",
      url: "/finance/findrfrom/" + name,
      async: false,
      headers: { "X-CSRFToken": csrftoken },
      success: function (data) {
        data.Message?.forEach((rfromname ) => {
          list.push(rfromname );
        });
      },
      
    });
    return list;
  }



  function rvaccount(name) {
    let list = [];
    $.ajax({
      method: "GET",
      url: "/finance/findaccount/" + name,
      async: false,
      headers: { "X-CSRFToken": csrftoken },
      success: function (data) {
        data.Message?.forEach((account) => {
          list.push(account);
        });
        console.log(data)
      },
    });
    return list;
  }

 // Performing autocomplete function of recieved from
  $("#rcfrom").on("input",function(){

    let rfromname = [];

    if($(this).val() != "" && $(this).val().length > 3){
      rfromname = rcfrom($(this).val());
      $("#rcfrom").autocomplete({
        source:rfromname,
        select:function(event,ui){
          const item = ui.item.value;
          const value = ui.item.value;
          if (value != "") {
            $("#rcfrom").attr("rcfrom", item)
            $("#personal_id").attr('value',ui.item.per_id )
            $("#mother_name").attr('value',ui.item.mot_name)

          }
        },
        response: function (event, ui) {
          if (!ui.content.length) {
            var noResult = { value: "", label: "No result found" };
            ui.content.push(noResult);
          }
        },
        minLength: 2,
      });
    }
  });


        

  // Performing autocomplete function of rv account
  $("#rvaccount").on("input", function () {

    let account = [];
    if ($(this).val() != "" && $(this).val().length > 2) {
      account = rvaccount($(this).val());
      $("#rvaccount").autocomplete({
        source: account,
        select: function (event, ui) {
          const item = ui.item.rv_account;
          const value = ui.item.rv_account;
          if (value != "") {
            $("#rvaccount").attr("rv_account", item)
            
            $("#rv_amount").attr('value','$ '+ui.item.amount )
          }
        },
        response: function (event, ui) {
          if (!ui.content.length) {
            var noResult = { value: "", label: "No result found" };
            ui.content.push(noResult);
          }
        },
        minLength: 2,
      });
    }
  });





  // finding recived from

 







  // $("#reciet_form").on("submit", function (e) {
  //   e.preventDefault()
  //   let formData = new FormData();


  //   // Validations
  //   if (rv_id == undefined || rv_number == "") {
  //     Swal.fire("Warning!!", "Please enter receipt voucher", "warning");
  //   }


  //   else {
  //     formData.append("rv_id", rv_id);
  //     formData.append("rv_number", rv_number);
  //     formData.append("rvnumber", rvid);
  //     formData.append("search1", rcfrom);
  //     formData.append("search1", rvaccount);
  //     formData.append("personal_id", persid)
  //     formData.append("rv_amount", rvamount);
  //     formData.append("mother_name", mothername)




  //     Swal.fire({
  //       title: "Are you sure",
  //       text: "to register this recipt ?",
  //       icon: "warning",
  //       showCancelButton: !0,
  //       confirmButtonColor: "#2ab57d",
  //       cancelButtonColor: "#fd625e",
  //       confirmButtonText: "Yes, register it!",
  //     }).then(function (e) {
  //       if (e.value) {
  //         $.ajax({
  //           method: "POST",
  //           url: "/customer/manage_license/" + 0,
  //           headers: { "X-CSRFToken": csrftoken },
  //           processData: false,
  //           contentType: false,
  //           data: formData,
  //           async: true,
  //           success: function (data) {
  //             if (!data.isError) {
  //               Swal.fire({
  //                 title: data.title,
  //                 text: data.Message,
  //                 icon: data.type,
  //                 confirmButtonColor: "#2ab57d",
  //                 cancelButtonColor: "#fd625e",
  //                 confirmButtonText: "Ok it!",
  //               }).then(function (e) {
  //                 if (e.value) {
  //                   window.location.reload();
  //                 }
  //               });
  //             } else {
  //               Swal.fire(data.title, data.Message, data.type);
  //             }
  //           },
  //           error: function (error) {
  //             //(error);
  //           },
  //         });
  //       }
  //     });

  //   }
  // });
});



