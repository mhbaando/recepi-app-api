$(document).ready(() => {


  const overlay = $(".overlay-assign")
  const modal = $(".containerr")
  const cancle = $(".Close-btn")


  $("#assign_btn").on("click", function () {
    overlay.attr("class", "overlay-assign")
    modal.attr("class", "containerr")
  })

  overlay.on("click", function () {
    overlay.attr("class", "hidden")
    modal.attr("class", "hidden")
  })

  cancle.on('click', function () {
    overlay.attr('class', 'hidden')
    modal.attr('class', 'hidden')
  })
  let stateappre = [{
    'name': 'Banaadir',
    'appreviation': 'BN'
  },
  {
    'name': 'Hirshabeelle',
    'appreviation': 'HR'
  },
  {
    'name': 'Galmudug',
    'appreviation': 'GM'
  },
  {
    'name': 'Puntland',
    'appreviation': 'PN'
  },
  {
    'name': 'Koonfur Galbeed',
    'appreviation': 'KG'
  },
  {
    'name': 'Jubba land',
    'appreviation': 'JL'
  },
  {
    'name': 'Somali land',
    'appreviation': 'SL'
  }
  ]

  let plateNo = ""
  let vehicleIdd = ""
  let type = ""

  let state = "" // for form to display satateid
  let stateplate = "" // for user to display statet
  let code = ""  // for form to dispay code ID
  let codeplate = "" // for user to display code
  const ownar_name = $("#owner_info")
  const hidden = $("#veh_hid_id")
  let number = $("#number")

  let year = ""
  $("#year").on("change", () => {
    year = $("#year option:selected").val()
  })

  let code_plates = ""
  $("#code").on("change", () => {
    code_plates = $("#code option:selected").val()
    if (code_plates === 'Select A Code') {
      $("#btn-save").prop('disabled', true);

    }
  })

  let state_plate = ""
  $("#state").on("change", () => {
    state_plate = $("#state option:selected").val()
    if (state_plate === 'Select State') {
      $("#btn-save").prop('disabled', true);

    }
  })



  const assign_btn = document.querySelectorAll("#assign_btn")
  assign_btn.forEach(btn => {
    btn.addEventListener("click", function () {
      vehicleIdd = $(this).data('assignvehicleid')
      overlay.attr("class", "overlay-assign")
      modal.attr("class", "containerr")

      fetch('/vehicles/vehicle_info/' + vehicleIdd, {
        method: 'GET',
        headers: { "X-CSRFToken": csrftoken },
      }).then(res => res.json()).then(data => {
        // succes
        ownar_name.attr('value', `${data.vehicle_model} - ${data.owner}`)
      }).catch(err => {
        Swal.fire('Error', errr, 'error')
      })
    })
  })

  $("#type").on("change", () => {
    type = $("#type option:selected").val()
  })

  $("#code").on("change", () => {
    code = $("#code option:selected").val()
  })


  $("#state").on("change", function () {
    state = $("#state option:selected").val()
  })


  // Generete Plate Button
  $("#gen_plate").on('click', function () {
    // 1- state
    // 2- code plate 
    // check both them are not empty
    if (!state || state === 'Select State') {
      return Swal.fire('Error', 'Select State', 'error')
    }
    if (!code || code === 'Select A Code') {
      return Swal.fire('Error', 'Select Code', 'error')
    }

    let formData = new FormData()
    formData.append('plate_code', code)
    formData.append('plate_state', state)

    // send requerst the backend
    $.ajax({
      method: "POST",
      url: "/vehicles/vehicle_plate_gen/",
      headers: { "X-CSRFToken": csrftoken },
      processData: false,
      contentType: false,
      data: formData,
      async: true,
      success: function (res) {
        if (!res.isError) {
          number.val(res.gen_plate)
          plateNo = res.plate_no
          $("#btn-save").prop('disabled', false);
        } else {
          Swal.fire('Error', res.Message, 'error')
        }
      }
    })
  })


  // plate number
  // request to the backend getting the selected code, type,state 
  $('#reg_form').on('submit', function (e) {
    e.preventDefault();
    let formData = new FormData();




    if (!type || type === "Select a Type") {
      return Swal.fire("Error", "Select A Type", "error");
    }

    if (!year || year === "Select a year") {
      return Swal.fire("Error", "Select A year", "error");
    }
    if (!code || code === "Select a code") {
      return Swal.fire("Error", "Select A code", "error");
    }
    if (!state || state === "Select a state") {
      return Swal.fire("Error", "Select A State", "error");
    }
    if (!plateNo) {
      console.log(plateNo)
      return Swal.fire("Error", "Provide a plate Number", "error");

    }
    formData.append("type", type);
    formData.append("code", code);
    formData.append("state", state);
    formData.append("number", plateNo);
    formData.append("vehicleIdd", vehicleIdd);
    formData.append("year", year);


    $.ajax({
      method: "POST",
      url: "/vehicles/assignplate/",
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
              location.replace('/vehicles/viewvehicle')
            }
          });

          // resete the form 
          $("#reg_form")[0].reset()

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





})


