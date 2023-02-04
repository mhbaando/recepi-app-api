$(document).ready(function () {


  $("#submit").on("click", function () {

    let receipt_voucher = $("#search").attr("rv_id");
    let receipt_voucher_value = $("#search").val();
    let place_issue = $("#place_issue").val();
    let state_name = $("#state_name").val();
    let formData = new FormData();

    // Validations
    if (receipt_voucher == undefined || receipt_voucher_value == "") {
      Swal.fire("Warning!!", "Please enter receipt voucher", "warning");
    } 
    
    else if (place_issue == "") {
      Swal.fire(
        "Warning!!",
        "Please select place issued",
        "warning"
      );
    } 
    else if (state_name == "") {
      Swal.fire(
        "Warning!!",
        "Please select state",
        "warning"
      );
    } 
    else {
        formData.append("receipt_voucher", "receipt_voucher");
        formData.append("receipt_voucher_value", receipt_voucher_value);
        formData.append("Weapons", Weapons);
   
        Swal.fire({
          title: "Are you sure",
          text: "to insert this data ?",
          icon: "warning",
          showCancelButton: !0,
          confirmButtonColor: "#2ab57d",
          cancelButtonColor: "#fd625e",
          confirmButtonText: "Yes, insert it!",
        }).then(function (e) {
          if (e.value) {
            $.ajax({
              method: "POST",
              url: "/customer/manage_license/" + 0,
              headers: { "X-CSRFToken": csrftoken },
              processData: false,
              contentType: false,
              data: formData,
              async: true,
              success: function (data) {
                if (!data.isError) {
                  Swal.fire({
                    title: data.title,
                    text: data.Message,
                    icon: data.type,
                    confirmButtonColor: "#2ab57d",
                    cancelButtonColor: "#fd625e",
                    confirmButtonText: "Ok it!",
                  }).then(function (e) {
                    if (e.value) {
                      window.location.reload();
                    }
                  });
                } else {
                  Swal.fire(data.title, data.Message, data.type);
                }
              },
              error: function (error) {
                //(error);
              },
            });
          }
        });
      
    }
  });

  // Performing autocomplete function
  $("#search").on("input", function () {

    var listUsers = [];
    if ($(this).val() != "" && $(this).val().length > 2) {
      listUsers = Receiptvoucher($(this).val());

      $("#search").autocomplete({
        source: listUsers,
        select: function (event, ui) {
          const item = ui.item.bullet_id;
          const value = ui.item.value;
          if (value != "") {
            $("#search").attr("userid", item);
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
      url: "/customer/receipt_voucher/" + id,
      async: false,
      headers: { "X-CSRFToken": csrftoken },
      success: function (data) {
        data.Message.forEach((bullet) => {
          list.push(bullet);
        });
      },
    });

    return list;
  }

  function customer(ID) {
    $.ajax({
      method: "GET",
      url: "/customer/receipt_voucher/" + id,
      async: false,
      headers: { "X-CSRFToken": csrftoken },
      success: function (data) {
        if (!data.isError) {
          $("#ownar_name").val(data.Message.ownar_name);
          $("#mother_name").val(data.Message.mother_name);
          $("#personal_id").val(data.Message.personal_id);
          $("#personal_id_type").val(data.Message.personal_id_type);
          $("#licence_no").val(data.Message.license);
          
        } else {
          Swal.fire( data.title, data.Message,  data.type);
        }
      },
      error: function (error) {
        error;
      },
    });
  }
  });
  