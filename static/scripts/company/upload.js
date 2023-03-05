$(document).ready(() => {
  $('#upload').change(function() {
    const file = this.files[0];
    if (file) {
      let reader = new FileReader();
      reader.onload = function(event) {
        $('#uploadedAvatar').attr('src', event.target.result);
      }
      reader.readAsDataURL(file);
    }
  });


  // company doc
  $("#doc").on("change", function() {
    let file = this.files[0]
    if (file) {
      if (file.size > 2000000) {
        Swal.fire('Error', 'Upploaded file exceeded maximum size')
        return false
      } else {
        $("#doc-name").text(file.name)
      }
    }
  })
});


