$(document).ready(function () {
  // GetReport();

  $("#RoleType").on("change", function () {
    let user = $("#search_user").attr("username");
    if (user != null && user != "" && user != undefined) {
      GetReport();
    }
  });

  $("#search_user").on("input", function (e) {
    $("#rolesList tbody").html("");
    $("#search_user").removeAttr("username");
    var listUsers = [];
    if ($(this).val() != "" && $(this).val().length > 3) {
      listUsers = SearchEngine($(this).val());

      $("#search_user").autocomplete({
        source: listUsers,
        select: function (event, ui) {
          const item = ui.item;
          const value = ui.item.value;

          if (value != "") {
            $("#search_user").attr("username", item.username);
            $("#search_user").attr("userid", item.userid);
            GetReport();
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
  });

  function SearchEngine(letter) {
    var list = [];
    $.ajax({
      method: "GET",
      url: "/search_engine/" + letter,
      async: false,
      headers: { "X-CSRFToken": csrftoken },
      success: function (data) {
        data.Message.forEach((user) => {
          list.push(user);
        });
      },
    });

    return list;
  }

  function GetReport() {
    let formData = new FormData();
    formData.append("type", "GetUserReport");
    formData.append("user", $("#search_user").attr("userid"));
    formData.append("report", $("#RoleType").val());

    $.ajax({
      method: "POST",
      url: "/manage_permission_report",
      processData: false,
      contentType: false,
      headers: { "X-CSRFToken": csrftoken },
      data: formData,
      async: false,
      success: function (data) {
        var table1 = "",
          table2 = "";
        if ($("#RoleType").val() == "Role") {
          $("#rolesList").removeClass("d-none");
          $("#groupsList").addClass("d-none");
          $("#rolesList tbody").html('');
          $("#groupsList tbody").html('');
        } else {
          $("#rolesList").addClass("d-none");
          $("#groupsList").removeClass("d-none");
          $("#rolesList tbody").html('');
          $("#groupsList tbody").html('');
        }

        data.Message.forEach((item) => {
          if ($("#RoleType").val() == "Role") {
            $("#rolesList tbody").append(`
            <tr>
              <td>${item.App}</td>
              <td>${item.Model}</td>
              <td>${item.Codename}</td>
            </tr>
          `);
            
          } else {
            $("#groupsList tbody").append(`
            <tr>
              <td>${item.GroupName}</td>
              <td>${item.Permissions}</td>
              <td>
              <button type="button" class="btn btn-success  showPerms" GroupID = ${item.GroupID}>
                <i class="bx bx-show-alt"></i>
              </button></td>
            </tr>
          `);
          }
        });
      },
    });
  }

  $("#groupsList tbody").on("click", ".showPerms", function (e) {
    $(".group_permisions_roles").modal("show");
    let id = $(this).attr("GroupID");

    $.ajax({
      method: "POST",
      url: "/manage_group_permission/" + id.toString() + "/0",
      headers: { "X-CSRFToken": csrftoken },
      async: false,
      success: function (data) {
        if (!data.isError) {
          if (data.Message.length > 0) {
            $("#group_permisions_rolesTable tbody").html("");
            let rows = "";
            for (let i = 0; i < data.Message.length; i++) {
              rows += `
                  <tr>
                      <td>${data.Message[i].Model}</td>
                      <td>${data.Message[i].Name}</td>
                      <td>${data.Message[i].Codename}</td>
                      </tr>
                `;
            }

            $("#group_permisions_rolesTable tbody").html(rows);
          } else {
            $("#group_permisions_rolesTable tbody").html("No Data");
          }
        } else {
          $("#group_permisions_rolesTable tbody").html("No Data");
        }
      },
    });
  });
});
