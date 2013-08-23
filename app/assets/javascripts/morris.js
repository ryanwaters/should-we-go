$(document).ready(function(){

  var colors = ['red', 'skyblue', 'green', 'gold'];

  $.ajax(
    '/surf_chart',
    { success: function (graph_data) {
        $('.busy').hide();
        var container = $('.container');

        container.append('<div id="beverage_graph_week" />');

      new Morris.Line({
        // ID of the element in which to draw the chart.
        element: 'beverage_graph_week',
        // Chart data records -- each entry in this array corresponds to a point on
        // the chart.
        data: graph_data,
        // The name of the data record attribute that contains x-values.
        xkey: 'day',
        // A list of names of data record attributes that contain y-values.
        ykeys: ['coffee', 'water', 'soda', 'beer'],
        // Labels for the ykeys -- will be displayed when you hover over the
        // chart.
        labels: ['coffee', 'water', 'soda', 'beer'],
        parseTime: false,
        lineColors: colors,
        hideHover: true
      });
    }
   }
  );

});