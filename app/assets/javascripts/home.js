$(document).ready(function(){
	$('body').on('click', '#done', function(event){
		// event.preventDefault();
		var href = $(this).siblings('a').attr('href')

		 $.ajax({ url: '/tasks/' + $(this).data('id'), type: 'PUT', data: { task: { 'done': $(this).prop('checked') } } });
		// console.log(href);
	});	
});

