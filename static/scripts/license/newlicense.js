$(document).ready(function () {
  
  $("#state_name").on("change", function () {
    state = $("#state_name option:selected").val()
  
    fetch('/customer/state_op/' + state, {

      
      method: 'GET',
      headers: { "X-CSRFToken": csrftoken },
      
    }).then(res => res.json()).then(data => {
      // succes
      // state.attr('value', `${data.s_state}`)
      // console.log(data.s_state);
      console.log(data.s_state);
      console.log(data.s_name);
    
    
      if ($(this).val()) {
        $("#place_issue").prop('disabled', false)
        $("#place_issue").append(`<option value="${data.s_state}">${data.s_name}</option> `)
      } else {
        $("#place_issue option:eq(1)").prop("selected", true);
        $("#place_issue").prop('disabled', true)
      }
      
      
    }).catch(err => {
      Swal.fire('Error', err, 'error')
    })
  })
  })

  $("#submit").on("click", function () {

    let rv_id = $("#search").attr("rv_id");
    let rv_number = $("#search").val();
    let place_issue = $("#place_issue").val();
    let state_name = $("#state_name").val();
    let license_type = $("#license_type").val();
    let formData = new FormData();

    // Validations
    if (rv_id == undefined || rv_number == "") {
      Swal.fire("Warning!!", "Please enter receipt voucher", "warning");
    }

    if (place_issue == "") {
      Swal.fire(
        "Warning!!",
        "Please select place issued",
        "warning"
      );
    }
    if (state_name == "") {
      Swal.fire(
        "Warning!!",
        "Please select state",
        "warning"
      );
    }
    if (license_type == "") {
      Swal.fire(
        "Warning!!",
        "Please select type",
        "warning"
      );
    }


    if ($('#licence_no') === 'no Lecenses') {
      Swal.fire('Error', 'This customer has no licanse create license before you renew', 'error')
    }

    formData.append("rv_id", rv_id);
    formData.append("rv_number", rv_number);
    formData.append("federal_state", state_name);
    formData.append("place_issue", place_issue);
    formData.append("license_type", license_type);
    formData.append("Type", "new_license");

    Swal.fire({
      title: "Are you sure",
      text: "to register this license ?",
      icon: "warning",
      showCancelButton: !0,
      confirmButtonColor: "#2ab57d",
      cancelButtonColor: "#fd625e",
      confirmButtonText: "Yes, register it!",
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
                  location.replace('/customer/license_lists')
                }
              });
            } else {

              Swal.fire("Error", 'No License', "error");
            }
          },
          error: function (error) {

            Swal.fire("Error", 'no license', "error");

          },
        });
      }
    });


  });

  // Performing autocomplete function
  $("#search").on("input", function () {

    $("#ownar_name").val("");
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
      url: "/customer/receipt_voucher/" + id,
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

  function customer(id) {
    $.ajax({
      method: "GET",
      url: "/customer/customer_info/" + id,
      async: false,
      headers: { "X-CSRFToken": csrftoken },
      success: function (data) {
        if (!data.isError) {
          $("#ownar_name").val(data.Message.ownar_name);
          $("#mother_name").val(data.Message.mother_name);
          $("#personal_id").val(data.Message.personal_id);
          $("#personal_id_type").val(data.Message.personal_id_type);

        } else {
          Swal.fire(data.title, data.Message, data.type);
        }
      },
      error: function (error) {
        error;
      },
    });
  }

