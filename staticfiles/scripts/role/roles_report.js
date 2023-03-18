$(document).ready(function () {
  GetApps();
  GetModals($("#ListApps").val());
  GetCodes($("#ListApps").val(), $("#ListModals").val());
  GetReport();

  $("#RoleType").on("change", function () {
    if ($(this).val() == "Group") {
      $(this).parent().removeClass("col-md-3");
      $(this).parent().addClass("col-md-6");
      $(".groupClass").removeClass("d-none");
      $(".roleClass1").addClass("d-none");
      $(".roleClass2").addClass("d-none");
      $(".roleClass3").addClass("d-none");
      GetGroups();
    } else {
      $(this).parent().addClass("col-md-3");
      $(this).parent().removeClass("col-md-6");
      $(".groupClass").addClass("d-none");
      $(".roleClass1").removeClass("d-none");
      $(".roleClass2").removeClass("d-none");
      $(".roleClass3").removeClass("d-none");
      GetApps();
      GetModals($("#ListApps").val());
      GetCodes($("#ListApps").val(), $("#ListModals").val());
      GetReport();
    }
  });

  $("#ListApps").on("change", function () {
    GetModals($("#ListApps").val());
    GetCodes($("#ListApps").val(), $("#ListModals").val());
    GetReport();
  });

  $("#ListModals").on("change", function () {
    GetCodes($("#ListApps").val(), $("#ListModals").val());
    GetReport();
  });

  $("#ListOfCodes").on("change", function () {
    GetReport();
  });

  $("#ListGroups").on("change", function () {
    GetReport();
  });

  function GetApps() {
    let formData = new FormData();
    formData.append("type", "GetApps");

    $.ajax({
      method: "POST",
      url: "/manage_permission_report",
      processData: false,
      contentType: false,
      headers: { "X-CSRFToken": csrftoken },
      data: formData,
      async: false,
      success: function (data) {
        $("#ListApps").html("");
        data.Message.forEach((item) => {
          $("#ListApps").append(
            `<option value='${item.AppName}'>${item.AppName}</option>`
          );
        });
      },
    });
  }

  function GetModals(app) {
    let formData = new FormData();
    formData.append("type", "GetModals");
    formData.append("app", app);

    $.ajax({
      method: "POST",
      url: "/manage_permission_report",
      processData: false,
      contentType: false,
      headers: { "X-CSRFToken": csrftoken },
      data: formData,
      async: false,
      success: function (data) {
        $("#ListModals").html("");
        data.Message.forEach((item) => {
          $("#ListModals").append(
            `<option value='${item.ModalName}'>${item.ModalName}</option>`
          );
        });
      },
    });
  }

  function GetCodes(app, modal) {
    let formData = new FormData();
    formData.append("type", "GetCodes");
    formData.append("app", app);
    formData.append("modal", modal);

    $.ajax({
      method: "POST",
      url: "/manage_permission_report",
      processData: false,
      contentType: false,
      headers: { "X-CSRFToken": csrftoken },
      data: formData,
      async: false,
      success: function (data) {
        $("#ListOfCodes").html("");
        data.Message.forEach((item) => {
          $("#ListOfCodes").append(
            `<option contentType=${item.ContentID}  value=${item.CodeName}>${item.CodeName}</option>`
          );
        });
      },
    });
  }

  function GetGroups() {
    let formData = new FormData();
    formData.append("type", "GetGroups");

    $.ajax({
      method: "POST",
      url: "/manage_permission_report",
      processData: false,
      contentType: false,
      headers: { "X-CSRFToken": csrftoken },
      data: formData,
      async: false,
      success: function (data) {
        $("#ListGroups").html("");

        data.Message.forEach((item) => {
          $("#ListGroups").append(
            `<option value='${item.GroupName}'>${item.GroupName}</option>`
          );
        });

        if (data.Message.length == 0) {
          Swal.fire("warning", "No groups found", "warning");
        } else {
          GetReport();
        }
      },
    });
  }

  function GetReport() {
    let formData = new FormData();
    formData.append("type", "GetReport");
    formData.append("report", $("#RoleType").val());
    formData.append("app", $("#ListApps").val());
    formData.append("modal", $("#ListModals").val());
    formData.append("code", $("#ListOfCodes").val());
    formData.append("group", $("#ListGroups").val());

    $.ajax({
      method: "POST",
      url: "/manage_permission_report",
      processData: false,
      contentType: false,
      headers: { "X-CSRFToken": csrftoken },
      data: formData,
      async: false,
      success: function (data) {
        $("#usersList tbody").html('');

        data.Message.forEach((item) => {
          $("#usersList tbody").append(`
          <tr>
            <td><span class="avatar avatar-md brround" style="background-position:center; background-size: cover; background-image: url(/media/${item.Avatar})"></span></td>
            <td>${item.Username}</td>
            <td>${item.Name}</td>
          </tr>
          `);
          
        });
      },
    });
  }
});
