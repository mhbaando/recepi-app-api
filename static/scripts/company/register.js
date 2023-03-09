$(document).ready(function () {
  // get user image and uppload doc
  let logoImage = ""
  let companyDoc = ""
  let owner_id = ""

  $('#upload').change(function () {
    const file = this.files[0];
    if (file) {
      logoImage = file
    } else {
      logoImage = undefined
    }
  })

  $("#doc").on('change', function () {
    const file = this.files[0]
    if (file) {

      if (file.size > 2000000) {
        Swal.fire('Error', 'Upploaded file exceeded maximum size')
        return false
      }
      companyDoc = file
    } else {
      companyDoc = undefined
    }


  })

  // get state 
  let state = ""
  $("#state").on("change", () => {
    state = $("#state option:selected").val()
  })




  $("#re_form").on('submit', function (e) {
    e.preventDefault();

    const desc = $("#desc").val()
    const cname = $("#cname").val();
    const phone = $("#phone").val()
    const email = $("#email").val()
    const rnumber = $("#rnumber").val();
    const website = $("#website").val();
    const address = $("#address").val()

    let formData = new FormData();

    if (!logoImage) {
      return Swal.fire("Error", "Uppload company Image", "error");
    }

    if (!companyDoc) {
      return Swal.fire("Error", "Uppload Comapny Document", "error");
    }

    if (!state || state === "Select State") {
      return Swal.fire("Error", "Select State", "error");
    }

    formData.append("desc", desc);
    formData.append("cname", cname);
    formData.append("phone", phone);
    formData.append("email", email);
    formData.append("state", state);
    formData.append("owner", owner_id);
    formData.append("website", website);
    formData.append("rnumber", rnumber);
    formData.append("address", address);
    formData.append("logo", logoImage);
    formData.append("companyDoc", companyDoc);


    $.ajax({
      method: "POST",
      url: "/customer/company/resgiter",
      headers: { "X-CSRFToken": csrftoken },
      processData: false,
      contentType: false,
      data: formData,
      async: true,
      success: function (response) {
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
              location.replace('/customer/company-views/')
            }
          });

          // resete the form 
          $("#re_form")[0].reset()

        } else {
          Swal.fire("Error", response.Message, "error");
        }
      },
      error: function (error) {
        // handle error 
        console.log(error)

      }
    })



  })



  // search 
  function findOwner(name) {
    let owner = []
    $.ajax({
      method: "GET",
      url: "/customer/searchcustomer/" + name,
      async: false,
      headers: { "X-CSRFToken": csrftoken },
      success: function (data) {
        if (!data.isError) {
          owner = data.Message


        } else {
          Swal.fire(data.title, data.Message, data.type);
        }
      },
      error: function (error) {
        error;
      },
    });
    return owner
  }

  $("#search").on("input", function () {
    if ($(this).val().trim().length > 4) {
      const owner = findOwner($(this).val())
      $("#search").autocomplete({
        source: owner,
        select: function (event, ui) {
          const item = ui.item.full_name;
          const value = ui.item.value;
          if (value != "") {
            $("#search").attr("rv_id", item);
            owner_id = ui.item.owner_pk
            console.log(ui.item.owner_pk)
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
  })




  function customer(name) {
    $.ajax({
      method: "GET",
      url: "/customer/customer_info/" + name,
      async: false,
      headers: { "X-CSRFToken": csrftoken },
      success: function (data) {
        if (!data.isError) {
          $("#ownar_name").val(data.Message.ownar_name);

          console.log(data)
        } else {
          Swal.fire(data.title, data.Message, data.type);
        }
      },
      error: function (error) {
        error;
      },
    });
  }
})
