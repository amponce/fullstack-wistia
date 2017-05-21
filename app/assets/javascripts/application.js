// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery-ui/widgets/datepicker
//= require turbolinks
//= require_tree .


$(document).on('turbolinks:load', function() {
   $("input[name='file']").change(function(){
      this.form.submit();
  });
  var isChrome = !!window.chrome
  if (isChrome) {

  $('td.date').each(function() {
      var dateFormat = $(this).text()
      var dateFormat = $.datepicker.formatDate('mm/dd/yy', new Date(dateFormat));
      //alert(dateFormat);
      $(this).html(dateFormat + "<br>");

    });
  }
});
