// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require turbolinks
//= require dropzone
//= require bootstrap-sprockets
//= require underscore
//= require select2
//= require trix
//= require messages
//= require_tree .

$(document).on("turbolinks:load", function(){
$('#settings').on('click', function(e){
    e.preventDefault();
    $('.js-overlay-campaign').show()
})



$('.glyphicon-remove').click(function() { 
	$('.js-overlay-campaign').fadeOut();	
});


$(document).mouseup(function (e) { 
	var popup = $('.js-popup-campaign');
	if (e.target!=popup[0]&&popup.has(e.target).length === 0){
		$('.js-overlay-campaign').fadeOut();		
	}
});
 $('.theme-dark').click(function(){
    $('.navbar-default').removeClass('navbar-default').addClass('navbar-inverse');
  });
  $('.theme-white').click(function(){
    $('.navbar-inverse').removeClass('navbar-inverse').addClass('navbar-default');
  });

});
