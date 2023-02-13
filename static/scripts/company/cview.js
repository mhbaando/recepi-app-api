$(document).ready(function () {
    // Update The Entries Selection
    $("#DataNumber").val($("#DataNumber").attr("DataNumber"));
  
    $("#DataNumber").change(function () {
      RefreshPage();
    });
  
    $("#SearchQuery").on("change", function () {
      RefreshPage();
    });
  
    $("#SearchQueryBTN").on("click", function () {
      RefreshPage();
    });

    $("#Status").change(function () {
        RefreshPage();
      });

    $(".pagination .page-item").on("click", function () {
      const pageNumber = $(this).attr("page");
      $(".activePage").attr("activePage", pageNumber);
      RefreshPage();
    });
  
    function RefreshPage() {
      let page = $(".activePage").attr("activePage");
      let search = $("#SearchQuery").val();
      let entries = $("#DataNumber").val();
      let Status = $("#Status").val();
      
      let url = `/customer/company-views?DataNumber=${entries}&page=${page}&Status=${Status}`;
  
      if (search != "") {
        url += `&SearchQuery=${search}`;
      }
  
      window.location.replace(url);
    }
  });
  