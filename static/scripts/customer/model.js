$(document).ready(()=>{
    const overlay = $(".overlay")
    const modal = $(".model-contaier")
    const form = $("#verify-form")
    const cancle = $(".cancle-btn")

    // show model on click
    $(".verify-btn").on('click', function(){
        overlay.attr('class', 'overlay')
        modal.attr('class','model-contaier')
    })

    // hide modal
    overlay.on('click', function(){
        overlay.attr('class', 'hidden')
        modal.attr('class','hidden')
    })
    cancle.on('click',function(){
        overlay.attr('class', 'hidden')
        modal.attr('class','hidden')
    })

    // doc uppload
    let customerDoc = ""
	$("#doc").change(function(){
		let file = this.files[0]
		if(file){
			$("#doc-name").text(file.name)
            customerDoc = file
		}
        else{
            customerDoc = undefined
        }
	})

    // send data to the backend 
    form.on('submit',function(e){
        e.preventDefault()
        const desc = $('#desc').val()

        if(!customerDoc  ){
            return Swal.fire("Error", "Uppload Verification Document", "error");
        }

        if(desc.trim().length <= 0){
            return Swal.fire("Error", "Description Is Required", "error");
        }
    })
})