$(document).on('turbolinks:load',function(){
	$("#company_job_opportunity_ctc").change(function(){
		$("#ctc_label").text($(this).val());
	});
});
