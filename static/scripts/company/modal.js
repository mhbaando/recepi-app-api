$(document).ready(function () {
    const overlay = $(".overlay")
    const modal = $(".model-container")
    const cursor = $(".cursor")
   

    $("#blockbtn").on("click",()=>{
        // overlay.classList.remove("hidden")
        // modal.classList.remove("hidden")
        overlay.attr("class", "overlay")
        modal.attr("class", "model-container")
    })

    overlay.on("click",()=>{
        overlay.attr("class", "overlay hidden")
        modal.attr("class", "model-container hidden")
    })
    
    cursor.on("click",()=>{
        overlay.attr("class", "overlay hidden")
        modal.attr("class", "model-container hidden")
    })

  $(".close").on("click",()=>{
       overlay.attr("class", "overlay hidden")
        modal.attr("class", "modal-footer hidden")
    })


    $("#doc").on("change",function(){
		let file = this.files[0]
		if(file){
			$("#doc-name").text(file.name)
		}
	})

})