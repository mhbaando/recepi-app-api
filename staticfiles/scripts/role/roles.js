$(document).ready(function () {
  // Performing autocomplete function
  $("#staffID").on("input", function (e) {
    $("#table").attr("hidden", true);
    $("#permissions tbody").html("");
    $("#staffID").removeAttr("username");
    $("#AppType").html("");
    $("#ModelType").html("");
    var listUsers = [];
    if ($(this).val() != "" && $(this).val().length >= 4) {
      listUsers = SearchEngine($(this).val());

      $("#staffID").autocomplete({
        source: listUsers,
        select: function (event, ui) {
          const item = ui.item.username;
          const value = ui.item.value;

          if (value != "") {
            $("#staffID").attr("username", item);
            showGroups($(this).attr("username"));
            showModels($("#staffID").attr("username"), $("#AppType").val());
            showPermisisons($(this).attr("username"));
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
      url: "/search_engine/"+letter,
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
      url: "/manage_permission/" + id,
      headers: { "X-CSRFToken": csrftoken },
      async: false,
      success: function (data) {
        if (!data.isError) {
          let dataRow = "";
          $("#AppType").html("");
          if (data.Message.length > 0) {
            let temp = [];
            for (let i = 0; i < data.Message.length; i++) {
              !temp.includes(data.Message[i].App) &&
                $("#AppType").append(`
                <option  ${
                  i + 1 == data.Message.length ? "selected" : ""
                } value="${data.Message[i].App}">${data.Message[i].App}</option>
                `);
              temp.push(data.Message[i].App);
            }
          }
        } else {
          Swal.fire("error", data.Message, "error");
          $("#permissions tbody").html("");
        }
      },
    });
  }

  function showModels(id, app) {
    $.ajax({
      method: "GET",
      url: "/manage_permission/" + id,
      headers: { "X-CSRFToken": csrftoken },
      async: false,
      success: function (data) {
        if (!data.isError) {
          let dataRow = "";
          $("#ModelType").html("");
          if (data.Message.length > 0) {
            let temp = [];
            $("#ModelType").append(`
                <option App = ${app} value="All">All Models</option>
                `);
            for (let i = 0; i < data.Message.length; i++) {
              if (
                !temp.includes(data.Message[i].Model) &&
                data.Message[i].App == app
              ) {
                $("#ModelType").append(`
                <option App = ${app} value="${data.Message[i].Model}">${data.Message[i].Model}</option>
                `);
              }
              temp.push(data.Message[i].Model);
            }
          }
        } else {
          Swal.fire("error", data.Message, "error");
          $("#permissions tbody").html("");
        }
      },
    });
  }

  function showPermisisons(id) {
    $.ajax({
      method: "GET",
      url: "/manage_permission/" + id,
      headers: { "X-CSRFToken": csrftoken },
      async: false,
      success: function (data) {
        if (!data.isError) {
          let dataRow = "";
          if (data.Message.length > 0) {
            for (let i = 0; i < data.Message.length; i++) {
              if (
                ($("#ModelType").val() == data.Message[i].Model ||
                  $("#ModelType").val() == "All") &&
                $("option:selected", "#ModelType").attr("app") ==
                  data.Message[i].App
              ) {
                dataRow += `<tr><td>${data.Message[i].Model}</td>`;
                let track = 0;
                for (let x = 0; x < data.Message[i].Actions.length; x++) {
                  track++;

                  if (track > 4) {
                    dataRow += `</tr><tr><td></td>`;
                    track = 1;
                  }

                  dataRow += `
                <td>

                <div ActionID = ${
                  data.Message[i]["Actions"][x]["ID"]
                } class="form-check form-switch form-switch-md" dir="ltr">
                    <input  id=${
                      "someSwitchOption" + data.Message[i]["Actions"][x].ID
                    }  ${
                    data.Message[i]["Actions"][x]["isPermitted"]
                      ? "checked"
                      : ""
                  } ${
                    data.Message[i]["Actions"][x]["isSuperuser"]
                      ? "disabled"
                      : ""
                  } name='RolesInputs' type="checkbox" class="form-check-input">
                    <label for=${
                      "someSwitchOption" + data.Message[i]["Actions"][x].ID
                    } class="form-check-label" for="customSwitchsizemd">${
                    data.Message[i]["Actions"][x]["Action"]
                  }</label>
                </div>

              
                `;
                }
                dataRow += `</tr>`;
              }
            }

            $("#permissions tbody").html(dataRow);
          } else {
            $("#permissions tbody").html("");
          }
        } else {
          Swal.fire("error", data.Message, "error");
          $("#permissions tbody").html("");
        }
      },
    });
  }

  $("#AppType").on("change", function () {
    $("#permissions tbody").html("");
    showModels($("#staffID").attr("username"), $("#AppType").val());
    showPermisisons($("#staffID").attr("username"));
  });

  $("#ModelType").on("change", function () {
    $.ajax({
      method: "GET",
      url: "/manage_permission/" + $("#staffID").attr("username"),
      headers: { "X-CSRFToken": csrftoken },
      async: false,
      success: function (data) {
        if (!data.isError) {
          let dataRow = "";
          if (data.Message.length > 0) {
            for (let i = 0; i < data.Message.length; i++) {
              if (
                ($("#ModelType").val() == data.Message[i].Model ||
                  $("#ModelType").val() == "All") &&
                $("option:selected", "#ModelType").attr("app") ==
                  data.Message[i].App
              ) {
                dataRow += `<tr><td>${data.Message[i].Model}</td>`;

                let track = 0;
                for (let x = 0; x < data.Message[i].Actions.length; x++) {
                  if (
                    ($("#ModelType").val() == data.Message[i].Model ||
                      $("#ModelType").val() == "All") &&
                    $("option:selected", "#ModelType").attr("app") ==
                      data.Message[i].App
                  ) {
                    track++;

                    if (track > 4) {
                      dataRow += `</tr><tr><td></td>`;
                      track = 1;
                    }

                    dataRow += `
                <td>
                <div ActionID = ${
                  data.Message[i]["Actions"][x]["ID"]
                } class="form-check form-switch form-switch-md" dir="ltr">
                    <input  id=${
                      "someSwitchOption" + data.Message[i]["Actions"][x].ID
                    }  ${
                      data.Message[i]["Actions"][x]["isPermitted"]
                        ? "checked"
                        : ""
                    } ${
                      data.Message[i]["Actions"][x]["isSuperuser"]
                        ? "disabled"
                        : ""
                    } name='RolesInputs' type="checkbox" class="form-check-input">
                    <label for=${
                      "someSwitchOption" + data.Message[i]["Actions"][x].ID
                    } class="form-check-label" for="customSwitchsizemd">${
                      data.Message[i]["Actions"][x]["Action"]
                    }</label>
                </div>
                  </td>
                `;
                  }
                }
                dataRow += `</tr>`;
              }
            }

            $("#permissions tbody").html(dataRow);
          } else {
            $("#permissions tbody").html("");
          }
        } else {
          Swal.fire("error", data.Message, "error");
          $("#permissions tbody").html("");
        }
      },
    });
  });

  $("#permissions tbody").on("click", "input", function (e) {
    const input = $(this);
    let type = "";
    if ($(this).prop("checked")) {
      type = "Add";
    } else {
      type = "Remove";
    }

    let formData = new FormData();
    formData.append("type", type);
    formData.append("permID", $(this).parent().attr("ActionID"));
    formData.append("user", $("#staffID").attr("username").toUpperCase());
    $.ajax({
      method: "POST",
      url: "/manage_permission/0",
      headers: { "X-CSRFToken": csrftoken },
      processData: false,
      contentType: false,
      data: formData,
      async: false,
      success: function (data) {
        if (!data.isError) {
          showMessage(data.Message);
          showPermisisons($("#staffID").attr("username"));
        } else {
          $(input).prop("checked", false);
          Swal.fire("error", data.Message, "error");
        }
      },
    });
  });
});
