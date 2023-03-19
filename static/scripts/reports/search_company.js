$(document).ready(() => {

    // search selected customer
    const search_company = function (id) {
        $.ajax({
            method: 'GET',
            url: '/customer/comreport/company_report/' + id,
            async: true,
            success: function (res) {
                if (!res.isError) {
                    const data = res.company
                    // populate data company info
                    $('#coname').text(data.company_name);
                    $('#coemail').text(data.email);

                    $('#coaddress').text(data.address);
                    $('#cophone').text(data.phone)
                    $('#costatus').text(data.status)
                    $('#cowebsite').text(data.website)
                    $('#coregno').text(data.reg_no)
                    $('#coowner').text(data.owner)
                    $('#coregdate').text(data.reg_date)
                    $('#coreguser').text(data.reg_user)

                    // populate vehicles
                    const vh = res.vehicles
                    console.log(vh)
                    if (!vh || vh.length <= 0) {
                        $("#vhinfo").addClass("hidden")
                        $("#vhnfound").removeClass("hidden")

                    } else {
                        $("#vhinfo").removeClass("hidden")
                        $("#vhnfound").addClass("hidden")

                        // loop over vehicles
                        $.each(vh, function (i, item) {
                            const row = $('<tr>').appendTo('#vhtable tbody');
                            $("<td>").text(item.vehicle_id).appendTo(row);
                            $("<td>").text(item.model_year).appendTo(row);
                            $("<td>").text(item.vin).appendTo(row);
                            $("<td>").text(item.engine_no).appendTo(row);
                            $("<td>").text(item.color).appendTo(row);
                            $("<td>").text(item.hp).appendTo(row);
                            $("<td>").text(item.plate_no).appendTo(row);
                        })
                    }

                    $("#company-report-data").removeClass("hidden")

                }




            }
        },
        )
    }

    // search company name


    $("#searchcompany").on('input', function () {
        const val = $(this).val()
        if (val.trim().length >= 3) {
            //send request to the back-end
            $.ajax({
                method: 'GET',
                url: '/customer/comreport/search_company/' + val,
                headers: { "X-CSRFToken": csrftoken },
                async: true,
                success: function (res) {
                    $("#searchcompany").autocomplete({
                        source: res.Message,
                        select: function (event, ui) {
                            const item = ui.item.value;
                            const value = ui.item.value;
                            if (value != "") {
                                $("#searchcompany").attr("value", item);
                                search_company(ui.item.company_id)
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
    })

    // prevent refresh

    $("#searchcompanyform").on('submit', (e) => {
        e.preventDefault()
    })








})