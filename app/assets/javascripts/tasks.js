$(document).ready(function(){
	$('.slider').slider();

	$(function () {
		$('.datetimepicker').datetimepicker({
			startDate: "+0d"
		});
	});

	$('.category-btn').on('click', function(){

	CATEGORIES_ICONS = {1:'',2: '', 3:'', 4:'', 5:'', 6:'', 7:'', 8:'', 9:'', 10:'', 11:'', 12:'', 13:'', 14:'', 15:'', 16:''}
	CATEGORIES_NAMES = {1:'Romance',2: 'Entertainment', 3:'Drinks', 4:'Live Entertainment', 5:'Home', 6:'Education', 7:'Office', 8:'Travel', 9:'Correspondence', 10:'Garden', 11:'Shopping', 12:'Birthday', 13:'Meeting', 14:'Meal', 15:'Health', 16:'Call'}

		var categoryVal = $(this).val();
		$(this).siblings('.category-btn').removeClass('active');
		var hiddenField = $(this).closest('.btn-toolbar').find('.category-field');

		hiddenField.val(categoryVal);

		var newData = $(this).closest('.current-cat').find('.newdata');
		newData.text(CATEGORIES_ICONS[categoryVal] + " " + CATEGORIES_NAMES[categoryVal]);
	})

})