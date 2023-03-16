$(document).ready(() => {

    const elhodler = $("#testelholder");
    const eldisplayer = $("#eldispaly");
    let vhID = ""
    // search vehicle
    $("#search").on('input', function () {
        const val = $(this).val()
        if (val && val.trim().length >= 3) {
            // send rq and find this vehicle
            $.ajax({
                method: 'GET',
                url: '/vehicles/find_car/' + val,
                async: true,
                success: function (res) {
                    if (!res.isError) {
                        $("#search").autocomplete({
                            source: res.Message,
                            select: function (event, ui) {
                                const item = ui.item.value;
                                const value = ui.item.value;
                                if (value != "") {
                                    $("#search").attr("vehicle", item);
                                    $("#pid").val(ui.item.personal_id)
                                    $("#mdbrand").val(ui.item.model_year)
                                    $("#ophone").val(ui.item.phone)
                                    vhID = ui.item.vehicle_id
                                }
                            },
                            response: function (event, ui) {
                                if (!ui.content.length) {
                                    var noResult = { value: "", label: "No result found" };
                                    ui.content.push(noResult);
                                }
                            },
                            minLength: 4,
                        });
                    }
                    else {
                        Swal.fire('Error', res.Message, 'error')
                    }
                },
                error: function (error) {
                    Swal.fire('Error', error.statusText, 'error')
                }
            })
        }
    })



    // when selected category return elementes inside it
    let category = ""
    $("#testcat").on("change", () => {
        category = $("#testcat option:selected").val()
        if (category && category !== 'Select Category') {
            // send rq to the server and find cates associated with this car
            $.ajax({
                method: 'GET',
                url: '/vehicles/find_test_el/' + category,
                async: true,
                success: function (res) {
                    if (!res.isError) {
                        eldisplayer.empty();
                        $.map(res.test_el, function (el) {
                            eldisplayer.append(`
                            <div class="col-4 mt-3 d-flex align-items-center justify-content-start gap-2">
                                <input class="testEl form-check-input" type="checkbox" value="${el.id}" id="testel" />
                                <p class="form-check-label" for="testEl mb-0">${el.name}</p>
                            </div>
                            `)
                        })
                    }
                },
                error: function (err) {
                    Swal.fire('Error', err, 'error')
                }
            })
            elhodler.removeClass("hidden")
        } else {
            elhodler.addClass("hidden")
        }
    });


    // save MOT
    $("#reg_mot").on('submit', function (e) {
        e.preventDefault()
        const vin = $("#search").val()?.split('-')[1]?.trim() // get vin
        const testno = $("#testno").val()
        const testread = $("#testread").val()
        const expdate = $("expdate").val()


        // required="required"
        // if (!vin || !testno || !testread || expdate?.trim() || !category) {
        //     return Swal.fire('Error', 'All Feilds are Required', 'error')
        // }

        slectedTests = []
        $('input[type="checkbox"]:checked').each(function () {
            var checkboxValue = $(this).val();
            slectedTests.push(checkboxValue)
        });
        console.log(slectedTests)


    })
}) // end of doc