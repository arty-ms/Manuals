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
var AUTH_TOKEN=$('meta[name="csrf-token"]').attr('content');
  Dropzone.autoDiscover = false;
  var myDropzone = new Dropzone("div#mydropzone",{
    url: "/uploadfiles",
    autoProcessQueue: false,
    uploadMultiple: true,
    addRemoveLinks:true,
    parallelUploads:10,
    params:{
      'authenticity_token':  AUTH_TOKEN
    },
    successmultiple: function(data,response){
      $('#msgBoard').append(response.message).addClass("alert alert-success");
      $('#msgBoard').delay(2000).fadeOut();
      $('#fileslist').val(response.filesList);
      $('#myForm').off('submit').submit();
    }
  });
  $('#myForm').submit(function(e){
  if(myDropzone.getQueuedFiles().length > 0){
    e.preventDefault();
    myDropzone.processQueue();
  }
});
});