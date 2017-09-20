var API = "http://localhost:3000";

$(document).ready(function(){

  $('form').on('submit', function(event){
    event.preventDefault();
  });

  $('.wx-btn').on('click', function () {
    var destination = $('.wx').val();
    return $.ajax({
      url: API + '/api/v1/weathers',
      method: 'GET',
      data: { destination }
    })
    .done(function(forecast){
      $('.wx-search').empty()
      $('.wx-search').append('<p> Current Weather for: <strong class="new-trip">' + forecast.location + '</strong></p>' + '<p>' + forecast.conditions + ' & ' + forecast.temp + ' Degrees </p>' + '<p>' + forecast.humidity + ' Humidity & Winds ' + forecast.wind + ' </p>' +
                             '<form action="/weather" method="get"> <input type="text" name="forecast" value= "' + forecast.location + '" </form>' +
                             '<a href="/weather"> click here  to see the extended forecast </a>'
    );
    })
    .fail(function(error){
      console.error(error);
    });
  });
});
