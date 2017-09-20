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
      $('.wx-search').append('<ul><li class="new-trip"><a href="/weather"> Click for extended forecast: <font color="red">' + forecast.location + '</font>: ' + forecast.conditions + ' & ' + forecast.temp + ' Degrees </a></li></ul> '
    );
    })
    .fail(function(error){
      console.error(error);
    });
  });
});
