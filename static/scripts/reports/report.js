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

    })

    $("#vehicle").on('click', function () {
        $(this).addClass('active-choice');
        $("#company").removeClass("active-choice")
        $("#customer").removeClass("active-choice")

        // seach form
        $("#customer_search").addClass('hidden')
        $("#vehicle-search").removeClass("hidden")
        $("#company-search").addClass("hidden")
    })

    $("#company").on('click', function () {
        $(this).addClass('active-choice');
        $("#vehicle").removeClass("active-choice")
        $("#customer").removeClass("active-choice")

        // seach form
        $("#customer_search").addClass('hidden')
        $("#vehicle-search").addClass("hidden")
        $("#company-search").removeClass("hidden")
    })


    // seach form of each section-report -customer -company -&vehicle
})