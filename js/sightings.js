$(function() {
	$('#datepicker').datepicker({
		changeMonth: true,
		changeYear: true
	});
	
	$('#type_select').buttonset();
	
	$('#slide_dist').slider({
		value: 0,
		min: 0,
		max: 500,
		step: 10,
		slide: function(event, ui) {
			$('#distance').val(ui.value);
		}
	});
});