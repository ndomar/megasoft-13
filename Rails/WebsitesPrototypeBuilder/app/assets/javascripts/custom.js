$(function(){
	$('.new-todo input').keypress(function(e) {
		if (e.charCode != 13) return;
		if ($(this).val()!=""){
		var html = '<div class="todo span12">' + 
						'<div class="pull-left">' +
							'<label class="checkbox">' + 
								$(this).val() + 
								'<input type="checkbox">' +
							'</label>' +
						'</div>' +
						'<div class="pull-right">' +
							'<a href="#" data-toggle="tooltip" title="Click here to delete" class="delete btn btn-mini btn-danger">' +
								'<i class="icon-trash"></i>' + 
							'</a>' +
						'</div>' + '<div class="pull-right">' +
							'<a href="#" data-toggle="tooltip" title="Click here to edit" class="edit btn btn-mini btn">' +
								'<i class="icon-edit"></i>' + 
							'</a>' +
						'</div>'
					'</div>';

		$(this).val('').parent().after(html);
		$('.todo:last .delete').tooltip();
		$('.todo:last .edit').tooltip();
	}
	})

	$('#todos').on('click', '.todo input', function() {
		$(this).parent().parent().parent().toggleClass('finished')
	}).on('click', '.todo .delete', function() {
		$(this).parent().parent().slideUp(400, function() {
		})
	}).on('click', '.todo .edit', function() {
		var title = prompt('Enter the new title of the to do.')
		console.log(title)
		

	})

	$('#help').popover({
		placement: 'bottom',
		container: '#todos',
		title: 'Is it help you need?? Hmmm?',
		content: 'Well, this IS a simple todo application. So basically you just write up something that you\'re supposed to do in the textfield then press enter. You can also mark todo items are finished or not by clicking the checkbox. If you like you can delete it also. Bas lelasaf there is no edit button, make your own!!!!'
	});
});