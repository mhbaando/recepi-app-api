$(document).ready(() => {

    // search selected customer
    const search_customer = function (id) {
        $.ajax({
            method: 'GET',
            url: '/customer/reports/customer_report/' + id,
            async: true,
            success: function (res) {
                if (!res.isError) {
                    const data = res.customer
                    // populate data basic info
                    $("#fname").text(data.full_name)
                    $("#mname").text(data.mother_name)
                    $("#pid").text(data.personal_id)
                    $("#gender").text(data.gender)
                    $("#bgroup").text(data.bload_group)
                    $("#nation").text(data.nationality)
                    $("#email").text(data.email)
                    $("#phone").text(data.phone)
                    $("#dob").text(data.dob)
                    $("#address").text(data.address)
                    $("#state").text(data.state)
                    $("#reguser").text(data.reg_user)
                    $("#status").text(`(${data.status})`)
                    $("#status").addClass(`text-${data.status_class}`)

                    // populate licesne info
                    const li = res.found_license
                    if (li) {
                        $("#linfo").removeClass("hidden")
                        $("#lnfound").addClass("hidden")

                        $("#lino").text(li.license_no)
                        $("#listate").text(li.state)
                        $("#idate").text(li.issue_date)
                        $("#ltype").text(li.type)
                        $("#lplace").text(li.place_issue)
                        $("#lexp").text(li.expdate)
                        $("#lstatus").text(`(${li.status})`)
                        if (li.status === 'Active') {
                            $("#lstatus").addClass("license_status_active ")
                            $("#lstatus").removeClass("license_status_other")
                        } else {
                            $("#lstatus").removeClass("license_status_active")
                            $("#lstatus").addClass("license_status_other")
                        }
                    } else {
                        $("#lnfound").removeClass('hidden')
                        $("#linfo").addClass("hidden")
                        $("#lstatus").text("")

                    }

                    // populate compnay
                    const co = res.companies
                    if (!co || co.length <= 0) {
                        // displaye no compnay found
                        $("#confnd").removeClass("hidden")
                        $("#coinfo").addClass("hidden")

                    } else {
                        // displate company info
                        $("#confnd").addClass("hidden")
                        $("#coinfo").removeClass("hidden")
                        // loop over companies
                        $.each(co, function (i, item) {
                            const row = $('<tr>').appendTo('#cotable tbody');
                            $("<td>").text(item.reg_no).appendTo(row);
                            $("<td>").text(item.name).appendTo(row);
                            $("<td>").text(item.phone).appendTo(row);
                            $("<td>").text(item.email).appendTo(row);
                            $("<td>").text(item.address).appendTo(row);
                            $("<td>").text(item.state).appendTo(row);

                            if (item.status === 'Unblocked') {
                                $("<td class='text-success'>").text(item.status).appendTo(row);

                            }
                            else {
                                $("<td class='text-danger'>").text(item.status).appendTo(row);
                            }
                            $("<td>").text(item.reg_date).appendTo(row);
                        })
                    }


                    // populate vehicles
                    const vh = res.vehicles
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

                    // populate tranfer
                    const tr = res.transfer

                    if (!tr || tr.length <= 0) {
                        // show not trafere
                        $("#trinfo").addClass("hidden")
                        $("#trnfound").removeClass("hidden")
                        $("#times").text('(0 Times)')
                    } else {
                        $("#trnfound").addClass("hidden")
                        $("#trinfo").removeClass("hidden")

                        // loop over transfer
                        $.each(tr, function (i, item) {
                            const row = $('<tr>').appendTo("#trtable tbody");
                            $('<td>').text(item.rv_no).appendTo(row);
                            $('<td>').text(item.model_year).appendTo(row);
                            $('<td>').text(item.old_owner).appendTo(row);
                            $('<td>').text(item.new_owner).appendTo(row);
                            $('<td>').text(item.plate_no).appendTo(row);
                            $('<td>').text(item.reason).appendTo(row);
                            $('<td>').text(item.date).appendTo(row);
                            $("#times").text(`(${item.count} Times)`)
                        })
                    }

                    // populate payments
                    const py = res.payments
                    if (!py || py.length <= 0) {
                        $("#pyinfo").addClass("hidden")
                        $("#pynofound").removeClass("hidden")
                    } else {
                        $("#pyinfo").removeClass("hidden")
                        $("#pynofound").addClass("hidden")

                        $.each(py, function (index, item) {
                            const row = $('<tr>').appendTo("#pytable tbody");
                            $('<td>').text(item.rv_no).appendTo(row);
                            $('<td>').text(`$ ${item.amount}`).appendTo(row);
                            $('<td>').text(item.reason).appendTo(row);
                            $('<td>').text(item.date).appendTo(row);
                        })
                    }

                    // // remove hidden report
                    $("#customer-report-data").removeClass("hidden")
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
    let userID = ''
    $("#searchCustomer").on('input', function () {
        const val = $(this).val()
        if (val.trim().length >= 3) {
            // send request to the backend
            $.ajax({
                method: 'GET',
                url: '/customer/reports/search_customer/' + val,
                headers: { "X-CSRFToken": csrftoken },
                async: true,
                success: function (res) {
                    $("#searchCustomer").autocomplete({
                        source: res.Message,
                        select: function (event, ui) {
                            const item = ui.item.value;
                            const value = ui.item.value;
                            if (value != "") {
                                $("#searchCustomer").attr("value", item);
                                // call customer report functio after user selectes a customer
                                search_customer(ui.item.customer_id)
                                userID = ui.item.customer_id
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

    $("#searchCustomerForm").on('submit', (e) => {
        e.preventDefault()
    })


    // print customer 
    $("#customer_print").on('click', () => {
        console.log('here')
        window.location.href = `/print/customer/${userID}`
    })
})