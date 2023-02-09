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
  
    $(".pagination .page-item").on("click", function () {
      const pageNumber = $(this).attr("page");
      $(".activePage").attr("activePage", pageNumber);
      RefreshPage();
    });
  
    function RefreshPage() {
      let page = $(".activePage").attr("activePage");
      let search = $("#SearchQuery").val();
      let entries = $("#DataNumber").val();
  
      let url = `/vehicles/tranfer?DataNumber=${entries}&page=${page}`;
  
      if (search != "") {
        url += `&SearchQuery=${search}`;
      }
  
      window.location.replace(url);
    }
  });
  