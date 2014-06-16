
$(document).ready(function(){
	$('body').on('click', '#done', function(event){
		// event.preventDefault();
		var href = $(this).siblings('a').attr('href')
		$.ajax({ url: '/tasks/' + $(this).data('id'), type: 'PUT', data: { task: { 'done': $(this).prop('checked') } } });
	});	

	$('.panel-body .edit_task').on('submit', function(event){
		event.preventDefault();
		var form = this;
		$.ajax({ 
			url: $(this).attr('action'), 
			type: 'PUT', 
			data: $(this).serialize(),
			success: function(response){
				console.log(response);
				$(form).closest('.panel-collapse').collapse('toggle');
				var headers = ["title", "deadline", "importance", "difficulty", "description"];
				var newText = "";
				// for (var i in headers){
				// 	var header = headers[i];
				// 	newText += (response[header]+" ");

				// 	$(form).closest('.extraInfo').find("."+header).text(response[header]);
				// }

				var deadline = new Date(response["deadline"]);
				var a = moment(deadline);
				var deadlineString = a.format("dddd MMM Do YYYY, h:mm:ss A");

				 $(form).closest('article').find('a').text(response["title"] + " " + deadlineString);
				 $(form).closest('article').find('.description').text(response["description"]);
				 $(form).closest('article').find('.difficulty span').text(response["difficulty"]);
				 $(form).closest('article').find('.difficulty .progress-bar').attr('style', "width:" +response["difficulty"] * 10 +"%");
				 $(form).closest('article').find('.importance span').text(response["importance"]);
				 $(form).closest('article').find('.importance .progress-bar').attr('style', "width:" + response["importance"] * 10 +"%");
				 $(form).closest('article').find('.category').text(response["category"]);

				
			}
		});
	});



});

