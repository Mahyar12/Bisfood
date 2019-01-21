

console.log("hh");
$("#add-ans").click(function(){
	if($('#qtypes').val() == "image" || $('#qtypes').val() == "portrait")
		$("#ans").append('<div><div class="row"><div class="col-md-12"><input type="file" name="image"><input type="checkbox"></div></div><hr></div>');  
	else if($('#qtypes').val() == "text" || $('#qtypes').val() == "twoans")
		$("#ans").append('<div><div class="row"><div class="col-md-12"><input type="text" name="text"><input type="checkbox"></div></div><hr></div>');  
	else if($('#qtypes').val() == "table"){
		$("#ans").append(`<div><div class="row"><div class="col-md-12">
			Show Words <input type="text" name="text" id="show-words">
			<table width="100%" class="table table-bordered table-hover" id="table">
				<tbody>  
				  <tr>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				  </tr>
				  <tr>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				  </tr>
				  <tr>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				  </tr>
				  <tr>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				  </tr>
				  <tr>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				  </tr>
				  <tr>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				    <td contenteditable="true"></td>
				  </tr>
				</tbody>
			</table></div></div><hr></div>`); 
			$('#add-ans').prop('disabled', 'disabled');		 
	}
	$('#qtypes').prop('disabled', 'disabled');
});

$("#delete-ans").click(function(){
	$("#ans").children().last().remove();
	$('#qtypes').prop('disabled', false);
	$('#add-ans').prop('disabled', false);	
});

$("#form").submit(function(evt){   
    evt.preventDefault();
	req = {};
	req.questions = [{question: $("#question").val(), type: $('#qtypes').val(), answers: []}];
    if($('#qtypes').val() == "image" || $('#qtypes').val() == "portrait"){
    	    var data = new FormData();
	    $( "#ans input" ).each(function( index ) {	   
	      	if(index%2 === 0)
	      		data.append('images[]', $(this)[0].files[0]); 	
			// data.append();			    
			else 
				req.questions[0].answers.push({answer_type_id: null, answer_type: "image", correct: ($(this).prop('checked')?1:0)});
	    });
	    // data.append('question', $("#question").val());
	    // data.append('type', $("#qtypes").val());	    
	    $.ajax({
	       url: "/images/upload",
	       type: 'POST',
	       data: data,
	       async: false,
	       cache: false,
	       contentType: false,
	       enctype: 'multipart/form-data',
	       processData: false,
	       success: function (response) {
	         // alert(JSON.stringify(response));
	         for(i = 0 ; i < response.files.length ; i++)
	         	req.questions[0].answers[i]['answer_type_id']= response.files[i].id;
	         console.log(req);
	         $.ajax({
		       url: "/add_question.json",
		       type: 'POST',
		       data: req,
		       success: function (response) {
		       	alert("OK");	
		       }
		    });
	       }
	   	});
	}
	else if($('#qtypes').val() == "text" || $('#qtypes').val() == "twoans"){

		$( "#ans input" ).each(function( index ) {	    	
			if(index%2 === 0)
				req.questions[0].answers.push({ answer: $(this).val(), answer_type: "text"});
			else 
				req.questions[0].answers[req.questions[0].answers.length-1].correct = ($(this).prop('checked')?1:0);					
	    });	    
	    $.ajax({
	       url: "/add_question.json",
	       type: 'POST',
	       data: req,
	       success: function (response) {
	       	alert("OK");	
	       }
	    });
	}
	else if($('#qtypes').val() == "table"){
		words = {words: [], places: []};
	  //   $('#table tr td').each(function(index) {
	  //   	console.log("index " + index + " " + (Math.floor(index/7)+1) + " " + (((Math.floor(index/8)+1)*8-index%8)-1));
			// console.log($(this).text()); 
			// if($(this).text() !== ""){
				
			// }   		    
	 	// });
	 	
 		for(j = 0 ; j < 6 ; j ++){
	 		for(i = 7 ; i >= 0 ; i--){	
	 			console.log($('#table tr:eq('+j+') td:eq('+i+')').text());
	 			if($('#table tr:eq('+j+') td:eq('+i+')').text()!==""){
	 				tmp = $('#table tr:eq('+j+') td:eq('+i+')').text();
	 				index=(7-i)+(j)*8+",";
	 				for(k = i-1 ; k >= 0 ; k--){
	 					if($('#table tr:eq('+j+') td:eq('+k+')').text()!==""){
	 						tmp += $('#table tr:eq('+j+') td:eq('+k+')').text();
	 						index += (7-k)+(j)*8 + ",";
	 						if(k === 0)
	 							i = k;
	 					}
	 					else{
	 						i = k;
	 						break;	
	 					} 
	 				}
	 				if(tmp.length > 2){
	 					words.words.push(tmp);
	 					words.places.push(index);	 					
	 				}
	 				tmp = "";
	 				index = "";
	 			}
	 		}
	 	}

 		for(i = 7 ; i >= 0 ; i--){	
	 		for(j = 0 ; j < 6 ; j ++){	
	 			console.log($('#table tr:eq('+j+') td:eq('+i+')').text());
	 			if($('#table tr:eq('+j+') td:eq('+i+')').text()!==""){
	 				tmp = $('#table tr:eq('+j+') td:eq('+i+')').text();
	 				index=(7-i)+(j)*8+",";
	 				for(k = j+1 ; k < 6 ; k++){
	 					if($('#table tr:eq('+k+') td:eq('+i+')').text()!==""){
	 						tmp += $('#table tr:eq('+k+') td:eq('+i+')').text();
	 						index += (7-i)+(k)*8 +",";
	 						if(k == 5)
	 							j = k;
	 					}
	 					else{
	 						j = k;
	 						break;	
	 					} 
	 				}
	 				if(tmp.length > 2){
	 					words.words.push(tmp);
	 					words.places.push(index);	 					
	 				}
	 				tmp = "";
	 				index = "";
	 			}
	 		}
	 	}
	 	console.log(words);
	 	req.questions[0].answers.push({correct: 1, show_chars: $("#show-words").val(), words: words,  answer_type: "table"});
	 	$.ajax({
	       url: "/add_question.json",
	       type: 'POST',
	       data: req,
	       success: function (response) {
	       	alert("OK");	
	       }
	    });
	}
   //  // get the input with file
   //  var formData = new FormData($(this)[0]);

   //  $.ajax({
   //     url: "/images/upload",
   //     type: 'POST',
   //     data: formData,
   //     async: false,
   //     cache: false,
   //     contentType: false,
   //     enctype: 'multipart/form-data',
   //     processData: false,
   //     success: function (response) {
   //       alert(JSON.stringify(response));
   //     }
   // });
   return false;
  });