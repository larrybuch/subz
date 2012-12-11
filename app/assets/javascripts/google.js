var map;
var canvas;

$(function(){

  $('#pick_a_line').click(show_lines);
  $('.lines').hide();
  $('.circle').hover(function () {
      $(this).fadeTo("slow", 0.33);
    },
    function () {
      $(this).fadeTo("fast", 1);
    });

  $('input[type="text"]').click(function(){$(this).val('');}); //clearing the input value text on click
});


function display_map(lat, long, zoom) //creates a map with this lat, this long, at this zoom level
{
  var mapOptions = {
    center: new google.maps.LatLng(lat, long),
    zoom: zoom,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  canvas = $('#map_canvas')[0]; //[0] will give us the first item in the array
  map = new google.maps.Map(canvas, mapOptions); //google map create a new map with these options
}

function add_marker(lat, long, title)
{
  var latlng = new google.maps.LatLng(lat, long);
  var marker = new google.maps.Marker({position: latlng, map: map, title:title});
}

function show_lines()
{
  $('.lines').toggle("slide");
}