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
			}
		});
	});



});

