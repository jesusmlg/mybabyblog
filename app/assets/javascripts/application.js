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
//= require turbolinks
//= require tinymce
//= require tinymce-jquery
//= require bootstrap-sprockets
//= require_tree .

///// Script de para botón de Facebook///////
(function(d, s, id) 
  {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/es_ES/sdk.js#xfbml=1&version=v2.0";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
/////////////////////////////////////////////


$(document).on('ready page:load',function(){
  markActive();
});

function markActive()
{
  var url = window.location.href;
  var result = url.substring(url.lastIndexOf("/")+1);
  
  if(result == "")
    result="inicio";
  $('.navbar-nav li').removeClass();
  $("#"+result).addClass('active');
}
$(document).on('click','#close_cookies',{},function(){
  $('#div-cookies').fadeOut('slow');
  $.ajax({
    url: '/close-div-cookies',
    type: 'POST',
    dataType: 'script',
    success: function(msg){
      alert("guardado");
    }
  });
})
