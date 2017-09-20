$(document).on('turbolinks:load', function() {
  var directionsService, directionsDisplay, map;
  if ($('.date-button').length > 0) {
    fetchAttractions($('#day-0').text());
  }
  $('#day-0').addClass('active');
  dateButton();
});

var dateButton = function () {
  $('.date-button').click(function(event) {
    event.preventDefault();
    $(this).addClass('active').siblings().removeClass('active')
    fetchAttractions($(this).text());
  })
}

var removeButton = function () {
  $('.remove-attraction-button').click(function(event) {
    event.preventDefault();
    deleteAttraction($(this).parent().data().name);
  })
};

var deleteAttraction = function (name) {
  var id = $('[data-lat]').data().id;
  var activeDate = $('.date-button.active').text();
  return $.ajax({
    url: '/api/v1/trips/' + id + '/itineraries',
    method: "DELETE",
    data: {date: activeDate, name: name},
    success: function (data) {
      fetchAttractions(activeDate);
    },
    failure: function(error) {
      console.error(error);
    }
  })
};

var fetchAttractions = function(date) {
  var id = $('[data-lat]').data().id;
  return $.ajax({
    url: '/api/v1/trips/' + id + '/attractions',
    method: "GET",
    data: {date: date},
    success: function (data) {
      debugger;
      $('#attractions').html('');
      initMap();
      if (data.length > 1) {
        renderCards(data);
        renderRoute(data);
      } else if (data.length === 1) {
        renderCards(data);
        setMarker(data);
      } else {
        renderCards(data);
      };
      removeButton();
    }
  })
};

var renderCards = function(data) {
  if (data.length > 0) {
    data.forEach(function(element){
      $('#attractions').append(element.html);
    });
  } else {
    $('#attractions').append('<h4 class="text-center">No attractions yet! Go add some more!</h4>');
  }
};

var renderRoute = function(data) {
  var origin = data.shift();
  var dest = data.pop();
  var waypoints = data.map(function(point){
  return {location: {lat: point.lat, lng: point.lng}};
  });
  directionsService.route({
    origin: {lat: origin.lat, lng: origin.lng},
    destination: {lat: dest.lat, lng: dest.lng},
    waypoints: waypoints,
    travelMode: 'DRIVING'},
    function(response, status) {
    directionsDisplay.setDirections(response)});
};

var setMarker = function(data) {
  marker = new google.maps.Marker({
    position: {lat: data[0].lat, lng: data[0].lng},
    map: map,
    title: data[0].name
  });
  map.setCenter({lat: data[0].lat, lng: data[0].lng})
  map.setZoom(14);
};

var initMap = function() {
  if ($('.trip-title').length > 0) {
    initTrips();
  } else if ($('.attraction-details-img').length > 0) {
    initAttraction();
  } else if ($('h2.city-name').length > 0) {
    initCity();
  } else {
    initWelcome();
  }
};

var initTrips = function() {
  var center = $('[data-lat]').data();;

  map = new (google.maps.Map)($('#map')[0], {
    zoom: 10,
    center
  });
  directionsService = new google.maps.DirectionsService;
  directionsDisplay = new google.maps.DirectionsRenderer({
    draggable: true,
    map: map,
    panel: document.getElementById('right-panel')
  });
};

var initAttraction = function() {
  var infowindow;
  var myLatLng = $('[data-lat]').data();

  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 17,
    center: myLatLng
  });

  var marker = new google.maps.Marker({
    position: myLatLng,
    map: map,
    icon: {url: attraction_img, scaledSize: new google.maps.Size(40, 40), origin: new google.maps.Point(0, 0), anchor: new google.maps.Point(0, 32)},
    title: '<%= raw @attraction.name %>'
  });
};

var initCity = function() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: $('[data-lat]').data(),
    zoom: 12
  });

  setMarkers(map);
};

function setMarkers(map) {
  attractions.forEach(function(attraction) {
    var marker = new google.maps.Marker({
      position: {lat: attraction.lat, lng: attraction.lng},
      map: map,
      icon: {url: attraction.photo, scaledSize: new google.maps.Size(40, 40), origin: new google.maps.Point(0, 0), anchor: new google.maps.Point(0, 32)},
      title: attraction.name
    });

    attraction.infoWindow = new google.maps.InfoWindow({
      content: `<div style="width: 150px; background-image: url(${attraction.photo});" class="city-image"></div><a href="/search?attraction=${attraction.place_id}"><h4>${attraction.name}</h4></a>`
    });
    google.maps.event.addListener(marker, 'click', function() {
      attraction.infoWindow.open(map, this);
    });
  });
};

var initWelcome = function () {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 39.7392, lng: -104.9903},
    zoom: 12
  });
};
