$(document).ready(() => {
    const search_vehicle = function (id) {
        $.ajax({
            method: 'GET',
            url: '/vehicles/reports/vehicle-report/' + id,
            async: true,
            success: function (res) {
                if (!res.isError) {
                    const data = res.vehicle
                    console.log(res.vehicle);
                    // populate data basic info
                    $("#vehicle_owner").text(data.vehicle_owner)
                    $("#vehicle_brand").text(data.vehicle_brand)
                    $("#vin").text(data.vin)
                    $("#color").text(data.color)
                    $("#weight").text(data.weight)
                    $("#hp").text(data.hp)
                    $("#passenger_seats").text(data.passenger_seats)
                    $("#engine_number").text(data.engine_no)
                    $("#rv_num_R").text(data.rv_number)
                    $("#year").text(data.year)
                    $("#origin").text(data.origin)
                    $("#plat_nu").text(data.plate_no)
                    $("#cylinder").text(data.cylinder)
                    $("#reg_user").text(data.reg_user)
                
                  

                    const trr = res.transfare_r
                    console.log(res.transfare_r);
                    if (!trr || trr.length <= 0) {
                        // show not trafere
                        $("#tr_hist").addClass("hidden")
                        $("#trfound").removeClass("hidden")
                        $("#transfare_times").text('(0 Times)')
                    } else {
                        $("#trfound").addClass("hidden")
                        $("#tr_hist").removeClass("hidden")

                        // loop over transfer
                        $.each(trr, function (i, item) {
                            const row = $('<tr>').appendTo("#transfer_table tbody");
                            $('<td>').text(item.rv_number).appendTo(row);
                            $('<td>').text(item.modal).appendTo(row);
                            $('<td>').text(item.old_owner_cus).appendTo(row);
                            $('<td>').text(item.new_owner_cust).appendTo(row);
                            $('<td>').text(item.plate_number).appendTo(row);
                            $('<td>').text(item.reason_tran).appendTo(row);
                            $('<td>').text(item.date_time).appendTo(row);
                            $("#transfare_times").text(`(${item.count_tran} Times)`)
                        })
                    
                }
                      // // remove hidden report
                   $("#vehicle_report").removeClass("hidden")
                  
                }
                else {
                    Swal.fire('Error', res.Message, 'error')
                }

            },
            error: function (err) {
                Swal.fire('Error', err.Message, 'error')
            }
        })
    }
        
    $("#SearchVehicle").on('input', function () {
    const val = $(this).val()
    if (val.trim().length >= 3) {
        // send request to the backend
        $.ajax({
            method: 'GET',
            url: '/vehicles/reports/search_vehicle/' + val,
            headers: { "X-CSRFToken": csrftoken },
            async: true,
            success: function (res) {
                $("#SearchVehicle").autocomplete({
                    source: res.Message,
                    select: function (event, ui) {
                        const item = ui.item.value;
                        const value = ui.item.value;
                        if (value != "") {
                            $("#search_vehicle").attr("value", item);
                            // call vehicle report function after user selectes a Vehicle
                            search_vehicle(ui.item.vehicle_id)

                           
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
            },
            error: function (err) {
                // deal error here
            }
        })
    }
    // prevent page refreshing
    $("#search_vehicle_form").on('submit', (e) => {
        e.preventDefault()
    })
    // hide when other customers clicked
    $("#customer").on('click', function () {
      
        $("#vehicle_report").addClass('hidden')
        

    })
    $("#company").on('click', function () {
      
        $("#vehicle_report").addClass('hidden')
        

    })
   
    // stay when when others clicked 
    $("#vehicle").on('click', function () {
      
        $("#vehicle_report").removeClass('hidden')
        

    })
})

})