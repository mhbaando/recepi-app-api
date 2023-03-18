$(document).ready(function () {

  let rvid = $("#rvnumber").val();
  let persid = $("personal_id").val();
  let rvamount = $("#rv_amount").val();
  let mothername = $("#mother_name").val();



  function rcfrom(name) {
    let list = [];
    $.ajax({
      method: "GET",
      url: "/finance/findrfrom/" + name,
      async: false,
      headers: { "X-CSRFToken": csrftoken },
      success: function (data) {
        data.Message?.forEach((rfromname) => {
          list.push(rfromname);
        });
      },

    });
    return list;
  }



  function rvaccount(id) {
    let list = [];
    $.ajax({
      method: "GET",
      url: "/finance/findaccount/" + id,
      async: false,
      headers: { "X-CSRFToken": csrftoken },
      success: function (data) {
        data.Message?.forEach((account) => {
          list.push(account);
        });
      },
    });
    return list;
  }

  // Performing autocomplete function of recieved from
  $("#rcfrom").on("input", function () {

    let rfromname = [];

    if ($(this).val() != "" && $(this).val().length > 3) {
      rfromname = rcfrom($(this).val());
      $("#rcfrom").autocomplete({
        source: rfromname,
        select: function (event, ui) {
          const item = ui.item.value;
          const value = ui.item.value;
          if (value != "") {
            $("#rcfrom").attr("rcfrom", item)
            $("#personal_id").attr('value', ui.item.per_id)
            $("#mother_name").attr('value', ui.item.mot_name)

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
    }
  });




  // Performing autocomplete function of rv account
  $("#rvaccount").on("input", function () {

    let account = [];
    if ($(this).val() != "" && $(this).val().length > 2) {
      account = rvaccount($(this).val());
      $("#rvaccount").autocomplete({
        source: account,
        select: function (event, ui) {
          const item = ui.item.rv_account;
          const value = ui.item.rv_account;
          if (value != "") {
            $("#rvaccount").attr("rv_account", item)

            $("#rv_amount").attr('value', '$ ' + ui.item.amount)
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
    }
  });
});



