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
//= require cocoon
//= require jquery
//= require('./maps')
//= require jquery_ujs
//= require geocomplete
//= require rails-ujs
//= require turbolinks
//= require_tree .
$(function() {
 $("#geo-input").geocomplete();
 $("#street").geocomplete({map: "#mapnew"});
 $("#city").geocomplete();
 $("#state").geocomplete();
});  

document.addEventListener("turbolinks:load", function() {

  var map = new GMaps({
    div: '#map',
    lat: 38.5816,
    lng: -121.4944
  });
  window.map = map;

  var addresses = JSON.parse(document.querySelector("#map").dataset.transactions);
  window.addresses = addresses;

  var bounds = new google.maps.LatLngBounds();

  addresses.forEach(function(address) {
    if (address.latitude && address.longitude) {
      var marker = map.addMarker({
        lat: address.latitude,
        lng: address.longitude,
        title: address.street,
        infoWindow: {
          content: `<p><a href='/addresses/${address.id}'>${address.street}</a></p>`
        }
      });

      bounds.extend(marker.position);
    }
  });

  map.fitBounds(bounds);
});



