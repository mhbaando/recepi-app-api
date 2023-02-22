$(document).ready(()=>{
	$('#upload').change(function(){
		const file = this.files[0];
		if (file){
		let reader = new FileReader();
		reader.onload = function(event){
			$('#uploadedAvatar').attr('src', event.target.result);
		}
		reader.readAsDataURL(file);
		}
	});


	// company doc
	$("#doc").on("change",function(){
		let file = this.files[0]
		
		if(file.size > 1000000){
			alert("you can not upload more then 1mb")
			return false;

		}
		if(file){
			$("#doc-name").text(file.name)
		}

		
	

	})
});

	
