// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.sortable
//= require jquery.remotipart
// Note: Foundation 5 won't work with turbolinks
//= require foundation
//= require_tree .
$(function() {
	$(document).foundation();

	$(document).on('closed', '[data-reveal]', function() {
		$(this).html('');
	});

	$(document).on('click', '[data-open-clearing-target]', function(e) {
		e.preventDefault();
		$($(this).data('open-clearing-target')+' li img').eq($(this).data('thumb-index')).trigger('click');
	});

	$(document).on('click', '[data-swapin]', function(e) {
		$($(e.currentTarget).data('swapout')).toggle();
		$($(e.currentTarget).data('swapin')).toggle();
	});

	$(document).on('click', '.show_dialog', function(e) {
		$('#dialog').foundation('reveal', 'open');
	});
	//Show and hide div____________________
	$('.js_pullable_title').click(function(e) {
		$(e.currentTarget).nextAll('.js_pullable_div:first').slideToggle();
	})
});