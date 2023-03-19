$(document).ready(function () {
  $("#staffID").on("input", function (e) {
    $("#table").attr("hidden", true);
    $("#group_permissions tbody").html("");
    $("#staffID").removeAttr("username");
    var listUsers = [];
    if ($(this).val() != "" && $(this).val().length > 3) {
      listUsers = SearchEngine($(this).val());

      $("#staffID").autocomplete({
        source: listUsers,
        select: function (event, ui) {
          const item = ui.item.username;
          const value = ui.item.value;

          if (value != "") {
            $("#staffID").attr("username", item);
            showGroups($(this).attr("username"));
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
      url: "/search_engine/" + letter ,
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

  function showGroups(id) {
    $.ajax({
      method: "GET",
      url: "/manage_group_permission/" + id + "/0",
      headers: { "X-CSRFToken": csrftoken },
      async: false,
      success: function (data) {
        if (!data.isError) {
          let dataRows = "";
          if (data.Message.length > 0) {
            for (var i = 0; i < data.Message.length; i++) {
              dataRows += `
              <tr>
                <td>${data.Message[i].Name}</td>
                <td>${data.Message[i].Count}</td>
                <td>
                <div GroupID = ${
                  data.Message[i].ID
                } class="form-check form-switch form-switch-md" dir="ltr">
                    <input type="checkbox" id=${
                      "someSwitchOption" + data.Message[i].ID
                    }   ${
                data.Message[i].IsSuper || data.Message[i].IsJoined
                  ? "checked"
                  : ""
              } ${
                data.Message[i].IsSuper ? "disabled" : ""
              } class="form-check-input" id="customSwitchsizemd">
                    <label class="form-check-label" for=${
                      "someSwitchOption" + data.Message[i].ID
                    }></label>
                </div>
                </td>
                <td>
                <button  type="button" class="btn btn-success  showPerms" GroupID = ${
                  data.Message[i].ID
                }>
                  <i class="bx bx-show-alt"></i>
                  </button>
                </td>
              </tr>
              `;
            }
          } else {
            $("#group_permissions tbody").html("");
          }

          $("#group_permissions tbody").html(dataRows);
        } else {
          Swal.fire("error", data.Message, "error");
        }
      },
    });
  }

  $("#group_permissions tbody").on("click", "input", function (e) {
    let type = "";
    if ($(this).prop("checked")) {
      type = "Add";
    } else {
      type = "Remove";
    }

    let formData = new FormData();
    formData.append("type", type);
    formData.append("permID", $(this).parent().attr("GroupID"));
    formData.append("user", $("#staffID").attr("username").toUpperCase());

    $.ajax({
      method: "POST",
      url: "/manage_group_permission/0/0",
      headers: { "X-CSRFToken": csrftoken },
      processData: false,
      contentType: false,
      data: formData,
      async: false,
      success: function (data) {
        if (!data.isError) {
          showMessage(data.Message);
          showGroups($("#staffID").attr("username"));
        } else {
          Swal.fire(data.Message);
        }
      },
    });
  });

  $("#group_permissions tbody").on("click", ".showPerms", function (e) {
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
            for (let i = 0; i < data.Message.length; i++) {
              $("#group_permisions_rolesTable tbody").append(`
                  <tr>
                      <td>${data.Message[i].Model}</td>
                      <td>${data.Message[i].Name}</td>
                      <td>${data.Message[i].Codename}</td>
                  </tr>
                `);
            }
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
