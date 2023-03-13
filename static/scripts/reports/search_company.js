$(document).ready(()=>{
    // search company selected

    const search_company = function(id){
        $.ajax({
            method:'GET',
            url:'/customer/comreport/company_report/'+id,
            async:true,
            success:function (res){
                if(!res.isError){
                    const data = res.search_company
                    // populate data company info
                    $('#name').text(data.company_name)
                    $('#email').text(data.email)
                    $('#address').text(data.address)
                    $('#phone').text(data.phone)
                    $('#status').text(`$({data.status})`)
                    $('#website').text(data.website)
                    $('#regno').text(data.reg_no)
                    $('#owner').text(data.owner)
                    $('#regdate').text(data.modified_at)
                    $('#reguser').text(data.reg_user)


                    $("#status").addclass(`text-${data.status_class}`)

                //    populate vehicle
                const comp = res.companies
                if(!comp || comp.length <= 0){
                    //display no vehicle found
                     $("#vhnfound").addclass("hidden")
                     $("#vhinfo").removeclass("hidden")


                     $.each(comp, function (i,item){
                        const row = $('<str>').appendTo('#vhtable tbody');
                        $("<td>").text(item.vehicle_id).appendTo(row);
                        $("<td>").text(item.model_year).appendTo(row);
                        $("<td>").text(item.vin).appendTo(row);
                        $("<td>").text(item.engine_no).appendTo(row);
                        $("<td>").text(item.color).appendTo(row);
                        $("<td>").text(item.hp).appendTo(row);
                        $("<td>").text(item.plate_no).appendTo(row);








                     })

                }

                }
            }
        })
    }
})

// search company name


$("#company-search").on('input',function(){
    const val = $(this).val()
    if(val.trim().length >=3){
        //send request to the back-end
        $.ajax({
            method:'GET',
            url:'/customer/comreport/search_company/'+val,
        headers: { "X-CSRFToken": csrftoken },
        async: true,
        success: function (res){
            $("#company-search").autocomplete({
                source: res.Message,
                select: function (event, ui) {
                    const item = ui.item.value;
                    const value = ui.item.value;
                    if (value != ""){
                        $("#company-search").attr("value", item);

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



