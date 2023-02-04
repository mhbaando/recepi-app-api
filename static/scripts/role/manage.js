$(document).ready(function () {
  const per_edit = $("#permissions").attr("edit");
  const per_delete = $("#permissions").attr("delete");
  const per_assign_role = $("#permissions").attr("add_role");
  const per_remove_role = $("#permissions").attr("remove_role");
  showManageGroups();
  insertType = "Insert";

  function showManageGroups() {
    $.ajax({
      method: "GET",
      url: "/manage_group/0",
      headers: { "X-CSRFToken": csrftoken },
      async: false,
      success: function (data) {
        if (!data.isError) {
          let dataRows = "";
          if (data.Message.length > 0) {
            let gid = $("#selecteditgroup").attr("groupid");
            for (var i = 0; i < data.Message.length; i++) {
              $("#selecteditgroup").append(
                `<option ${
                  data.Message[i].ID == gid ? "selected" : ""
                } value="${data.Message[i].ID}">${
                  data.Message[i].Name
                }</option>`
              );
              dataRows += `
                <tr>
                  <td>${data.Message[i].Name}</td>
                  <td>${data.Message[i].Count}</td>
                  <td>
                  <button type="button" class="btn btn-success  showPerms" GroupID = ${
                    data.Message[i].ID
                  }>
                  <i class="bx bx-show-alt"></i>
                  </button>

                  ${
                    per_assign_role == "True"
                      ? `<button type="button" class="btn btn-warning  editPerms" GroupID = ${data.Message[i].ID}>
                  Edit Roles
                  </button>`
                      : ""
                  }

                  ${
                    per_delete == "True"
                      ? `<button type="button" class="btn btn-danger  deletGroup" GroupID = ${data.Message[i].ID}>
                  <i class="bx bx-trash-alt"></i>
                  </button>`
                      : ""
                  }

                ${
                  per_edit == "True"
                    ? `<button type="button" class="btn btn-info  editGroup" GroupID = ${data.Message[i].ID}>
                  <i class="bx bx-pencil"></i>
                  </button>`
                    : ""
                }
                  </td>
                </tr>
                `;
            }
            if (gid != "" && gid != undefined) {
              showGroup(gid);
              showModels(gid, $("#AppType").val());
              showGroupRoles(gid);
            }
          } else {
            $("#group_permissions tbody").html("");
            $("#selecteditgroup").html("");
          }

          $("#group_permissions tbody").html(dataRows);
        } else {
          Swal.fire("error", data.Message, "error");
        }
      },
    });
  }

  $("#new_group").click(function () {
    $(".create_new_group").modal("show");
    $("#create_new_groupForm").trigger("reset");
  });

  $("#create_new_groupForm").on("submit", function (e) {
    e.preventDefault();
    let formData = new FormData();
    const name = $("#group_name").val();
    formData.append("name", name);
    if (insertType == "Update") {
      const id = $("#group_name").attr("GroupID");
      formData.append("ID", id);
      method = "POST";
      link = "/rename_group";
    } else {
      method = "POST";
      link = "/manage_group/0";
    }
    if (name != "") {
      $.ajax({
        method: method,
        url: link,
        beforeSend: function () {
          $("#add_new_group").addClass("btn-loading");
        },
        processData: false,
        contentType: false,
        data: formData,
        headers: { "X-CSRFToken": csrftoken },
        async: false,
        success: function (data) {
          $("#add_new_group").removeClass("btn-loading");
          if (!data.isError) {
            showMessage(data.Message);
            showManageGroups();
            $(".create_new_group").modal("hide");
            insertType = "Insert";
          } else {
            showMessage(data.Message);
          }
        },
      });
    } else {
      alert("Enter group name")
    }
  });

  $("#roles_lis tbody").on("click", "input", function (e) {
    let type = "";
    if ($(this).prop("checked")) {
      type = "Add";
    } else {
      type = "Remove";
    }

    let formData = new FormData();
    formData.append("type", type);
    formData.append("permID", $(this).parent().attr("ActionID"));

    $.ajax({
      method: "POST",
      url:
        
        "/manage_group/" +
        $(this).parent().attr("GroupID").toString(),
      headers: { "X-CSRFToken": csrftoken },
      processData: false,
      contentType: false,
      data: formData,
      async: false,
      success: function (data) {
        if (!data.isError) {
          showMessage(data.Message);
          let gid = $("#selecteditgroup").attr("groupid");
          showGroupRoles(gid);
        } else {
          Swal.fire("error", data.Message, "error");
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
            let rows = "";
            for (let i = 0; i < data.Message.length; i++) {
              rows += `
                  <tr>
                      <td>${data.Message[i].Model}</td>
                      <td>${data.Message[i].Name}</td>
                      <td>${data.Message[i].Codename}</td>
                `;

              if (per_remove_role == "True") {
                rows += `
                  <td>
                    <button PermID = ${data.Message[i].ID} GroupID = ${data.Message[i].GroupID} class="btn btn-danger  delete">
                        <i class="bx bx-trash-alt"></i>
                    </button>
                  </td>
                </tr>
                `;
              } else {
                rows += `</tr>`;
              }
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

  $("#group_permissions tbody").on("click", ".editPerms", function (e) {
    let id = $(this).attr("GroupID");
    window.location.replace("/edit_group/" + id);
  });

  $("#selecteditgroup").on("change", function (e) {
    $(".edit_roles").modal("show");
    let id = $(this).val();
    showGroup(id);
    showGroupRoles(id);
  });

  function showGroup(id) {
    $.ajax({
      method: "GET",
      url: "/manage_group/" + id.toString(),
      headers: { "X-CSRFToken": csrftoken },
      async: false,
      success: function (data) {
        if (!data.isError) {
          if (data.Message.length > 0) {
            // Fill Select Box
            let temp = [];
            $("#AppType").html("");
            $("#AppType").attr("GID", id);
            for (let i = 0; i < data.Message.length; i++) {
              !temp.includes(data.Message[i].App) &&
                $("#AppType").append(`
              <option value="${data.Message[i].App}">${data.Message[i].App}</option>
              `);
              temp.push(data.Message[i].App);
            }
          } else {
            $("#AppType").html("");
          }
        } else {
          $("#AppType").html("");
        }
      },
    });
  }

  function showModels(id, app) {
    $.ajax({
      method: "GET",
      url: "/manage_group/" + id.toString(),
      headers: { "X-CSRFToken": csrftoken },
      async: false,
      success: function (data) {
        if (!data.isError) {
          if (data.Message.length > 0) {
            // Fill Select Box
            let temp = [];
            $("#ModelType").html("");
            $("#ModelType").attr("GID", id);
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
              temp.push(data.Message[i].App);
            }
          } else {
            $("#ModelType").html("");
          }
        } else {
          $("#ModelType").html("");
        }
      },
    });
  }

  function showGroupRoles(id) {
    $.ajax({
      method: "GET",
      url: "/manage_group/" + id.toString(),
      headers: { "X-CSRFToken": csrftoken },
      async: false,
      success: function (data) {
        if (!data.isError) {
          if (data.Message.length > 0) {
            $("#roles_lis tbody").html("");
            let dataRow = "";
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
              } GroupID = ${id}  class="form-check form-switch form-switch-md" dir="ltr">
                    <input  id=${
                      "someSwitchOption" + data.Message[i]["Actions"][x].ID
                    }   ${
                    data.Message[i]["Actions"][x]["isGiven"] ? "checked" : ""
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
                dataRow += `</tr>`;
              }
            }

            $("#roles_lis tbody").html(dataRow);
          } else {
            $("#roles_lis tbody").html("");
          }
        } else {
          $("#roles_lis tbody").html("");
        }
      },
    });
  }

  $("#AppType").on("change", function () {
    let gid = $(this).attr("GID");
    $("#group_permisions_rolesTable tbody").html("");
    showModels(gid, $("#AppType").val());
    showGroupRoles(gid);
  });

  $("#ModelType").on("change", function (e) {
    let id = $(this).attr("GID");
    let xt = $(this).val();
    $.ajax({
      method: "GET",
      url: "/manage_group/" + id.toString(),
      headers: { "X-CSRFToken": csrftoken },
      async: false,
      success: function (data) {
        if (!data.isError) {
          if (data.Message.length > 0) {
            $("#roles_lis tbody").html("");
            let dataRow = "";
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
                } GroupID = ${id}  class="form-check form-switch form-switch-md" dir="ltr">
                      <input  id=${
                        "someSwitchOption" + data.Message[i]["Actions"][x].ID
                      }   ${
                      data.Message[i]["Actions"][x]["isGiven"] ? "checked" : ""
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
            $("#roles_lis tbody").html(dataRow);
          } else {
            $("#roles_lis tbody").html("");
            $("#ModelType").html("");
          }
        } else {
          $("#roles_lis tbody").html("");
        }
      },
    });
  });

  $("#group_permisions_rolesTable tbody").on("click", ".delete", function (e) {
    let GroupID = $(this).attr("GroupID");
    let PermID = $(this).attr("PermID");
    let event = e;
    Swal.fire({
      title: "Are you sure?",
      text: "You won't be able to get it after!",
      icon: "warning",
      showCancelButton: !0,
      confirmButtonColor: "#2ab57d",
      cancelButtonColor: "#fd625e",
      confirmButtonText: "Yes, delete it!",
    }).then(function (e) {
      if (e.value) {
        $.ajax({
          method: "DELETE",
          url:
            
            "/manage_group_permission/" +
            GroupID.toString() +
            "/" +
            PermID.toString(),
          headers: { "X-CSRFToken": csrftoken },
          async: false,
          success: function (data) {
            if (!data.isError) {
              showMessage(data.Message);
              showManageGroups();
              $(".group_permisions_roles").modal("hide");
            } else {
              showMessage(data.Message);
            }
          },
        });
      }
    });
  });

  $("#group_permissions tbody").on("click", ".deletGroup", function (e) {
    let event = e;
    let GroupID = $(this).attr("GroupID");
    let PermID = $(this).attr("PermID");
    Swal.fire({
      title: "Are you sure?",
      text: "You won't be able to get it after!",
      icon: "warning",
      showCancelButton: !0,
      confirmButtonColor: "#2ab57d",
      cancelButtonColor: "#fd625e",
      confirmButtonText: "Yes, delete it!",
    }).then(function (e) {
      if (e.value) {
        $.ajax({
          method: "DELETE",
          url: "/manage_group/" + GroupID.toString(),
          headers: { "X-CSRFToken": csrftoken },
          async: false,
          success: function (data) {
            if (!data.isError) {
              showMessage(data.Message);
              showManageGroups();
            } else {
              showMessage(data.Message);
            }
          },
        });
      }
    });
  });

  $("#group_permissions tbody").on("click", ".editGroup", function () {
    const btn = $(this);
    let GroupID = $(this).attr("GroupID");
    $(".create_new_group").modal("show");
    $("#create_new_groupForm").trigger("reset");
    $.ajax({
      method: "PATCH",
      url: "/manage_group/" + GroupID.toString(),
      beforeSend: function () {
        $(btn).addClass("btn-loading");
      },
      headers: { "X-CSRFToken": csrftoken },
      async: false,
      success: function (data) {
        $(btn).removeClass("btn-loading");
        if (!data.isError) {
          $("#group_name").val(data.Message.Name);
          $("#group_name").attr("GroupID", data.Message.id);
          insertType = "Update";
        } else {
          showMessage(data.Message);
        }
      },
    });
  });
});
