$(document).ready(function(){
	$('.slider').slider();
	$('.category-slider').slider({ formater: function(value) {
		return ['BLANK', 'Heart ', 'Film ', 'Drinks ', 'Concert ', 'Home ', 'School ', 'Office ', 'Travel ', 'Correspondence ', 'Private '][value];
	}});

	$(function () {
		$('.datetimepicker').datetimepicker();
	});

	// var sliderToChange = $('.category').find('.slider');
	
	// sliderToChange.tooltip.find('tooltip-arrow')('hide')
	// 		.attr('data-original-title', "AASDASD")
	// 		.tooltip('fixTitle')
	// 		.tooltip('show');

	// sliderToChange.on('slide', function(){

	// });


})