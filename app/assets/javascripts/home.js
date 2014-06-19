$(document).ready(function(){
			$(".complete").closest(".task").hide()



	$('body').on('click', '#done', function(event){
		var href = $(this).siblings('a').attr('href');

		$.ajax({ url: '/tasks/' + $(this).data('id'), type: 'PUT', data: { task: { 'done': $(this).prop('checked') } } });
		
		var text = ($(this).closest('.row').find('a').first());
		if (text.hasClass("complete")){
			$(text).removeClass("complete").addClass("incomplete");
			$(".incomplete").closest(".task").slideUp()

		}
		else{
			$(text).removeClass("incomplete").addClass("complete");
			$(".complete").closest(".task").slideUp()

		}
	});	

	$('.panel-body .edit_task').on('submit', function(event){

		CATEGORIES_ICONS = {1:'',2: '', 3:'', 4:'', 5:'', 6:'', 7:'', 8:'', 9:'', 10:'', 11:'', 12:'', 13:'', 14:'', 15:'', 16:''}
		CATEGORIES_NAMES = {1:'Romance',2: 'Entertainment', 3:'Drinks', 4:'Live Entertainment', 5:'Home', 6:'Education', 7:'Office', 8:'Travel', 9:'Correspondence', 10:'Garden', 11:'Shopping', 12:'Birthday', 13:'Meeting', 14:'Meal', 15:'Health', 16:'Call'}

		event.preventDefault();
		var form = this;
		$.ajax({ 
			url: $(this).attr('action'), 
			type: 'PUT', 
			data: $(this).serialize(),
			success: function(response){
				$(form).closest('.panel-collapse').collapse('toggle');

				var deadline = new Date(response["deadline"]);
				var deadlineString = moment(deadline).format("dddd, D MMM YYYY h:mm A");

				 $(form).closest('article').find('a').text(response["title"] + " " + deadlineString);
				 $(form).closest('article').find('.description').text(response["description"]);
				 $(form).closest('article').find('.difficulty span').text(response["difficulty"]);
				 $(form).closest('article').find('.difficulty .progress-bar').attr('style', "width:" +response["difficulty"] * 10 +"%");
				 $(form).closest('article').find('.importance span').text(response["importance"]);
				 $(form).closest('article').find('.importance .progress-bar').attr('style', "width:" + response["importance"] * 10 +"%");
				 $(form).closest('article').find('.category').text(CATEGORIES_NAMES[response["category"]]);
				 $(form).closest('article').find('.icon').text(CATEGORIES_ICONS[response["category"]]);
				 console.log(response["category"]);	
			}
		});
	});

	$('.completed').on('click', function(event){
		$(".complete").closest(".task").slideDown()
		$(".incomplete").closest(".task").slideUp()
		$(this).parent().addClass('active')
		$('.incompleted').parent().removeClass('active')

	});	
	
	$('.incompleted').on('click', function(event){
		$(".incomplete").closest(".task").slideDown()
		$(".complete").closest(".task").slideUp()
		$(this).parent().addClass('active')
		$('.completed').parent().removeClass('active')
	});


});

