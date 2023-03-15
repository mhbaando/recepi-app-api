$(document).ready(() => {
    $("#customer").on('click', function () {
        // active style
        $(this).addClass('active-choice')
        $("#vehicle").removeClass("active-choice")
        $("#company").removeClass("active-choice")

        // seach form
        $("#customer_search").removeClass('hidden')
        $("#vehicle-search").addClass("hidden")
        $("#company-search").addClass("hidden")

        // report document
        $("#company-report-data").addClass('hidden')
        $("#vehicle_report").addClass('hidden')

        // clean seach inputs
        $("#SearchVehicle").val('')
        $('#searchcompany').val('')

    })



    $("#vehicle").on('click', function () {
        $(this).addClass('active-choice');
        $("#company").removeClass("active-choice")
        $("#customer").removeClass("active-choice")

        // seach form
        $("#customer_search").addClass('hidden')
        $("#vehicle-search").removeClass("hidden")
        $("#company-search").addClass("hidden")

        // report document
        $("#customer-report-data").addClass('hidden')
        $("#company-report-data").addClass('hidden')

        // clean seach inputs
        $('#searchcompany').val('')
        $('#searchCustomer').val('')
    })

    $("#company").on('click', function () {
        $(this).addClass('active-choice');
        $("#vehicle").removeClass("active-choice")
        $("#customer").removeClass("active-choice")
      
         // seach form
        $("#customer_search").addClass('hidden')
        $("#vehicle-search").addClass("hidden")
        $("#company-search").removeClass("hidden")

        // report document
        $("#customer-report-data").addClass('hidden')
        $("#vehicle_report").addClass('hidden')

        // clean seach inputs
        $("#SearchVehicle").val('')
        $('#searchCustomer').val('')


        console.log('hhh')
    })


    // seach form of each section-report -customer -company -&vehicle
})