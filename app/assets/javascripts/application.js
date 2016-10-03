// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets 
//= require bootstrap-tagsinput
//= require bootstrap-multiselect
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require twitter/typeahead
//= require twitter/typeahead.min
//= require twitter/typeahead/bloodhound
//= require_tree .
<<<<<<< HEAD
//= require jquery_nested_form
=======
var bloodhound = new Bloodhound({
  datumTokenizer: function (d) {
    return Bloodhound.tokenizers.whitespace(d.value);
  },
  queryTokenizer: Bloodhound.tokenizers.whitespace,

  // sends ajax request to /typeahead/%QUERY
  // where %QUERY is user input
  remote: {url:'/typeahead'}, 
  limit: 50
});
bloodhound.initialize();

$('#typeahead').tagsinput({
  typeaheadjs: {
    displayKey: 'name',
    source: bloodhound.ttAdapter()
  }
});
>>>>>>> feature/candidate-controller
