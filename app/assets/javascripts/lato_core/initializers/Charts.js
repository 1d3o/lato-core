var ChartsInitializer = (function () {

  function initializeBarCharts () {
    var charts = $('.charts-bar')
    charts.each(function () {
      initializeBarChart(this)
    })
  }

  function initializeBarChart (chart) {
    var chartData = JSON.parse($(chart).find('.charts__metadata').html())

    var canvas = $(chart).find('.charts__canvas')[0]
    canvas.getContext('2d')

    var chartjs = new Chart(canvas, {
      type: chartData.chart_type,
      data: {
        labels: chartData.labels,
        datasets: chartData.datasets
      }
    })
  }

  // Init:

  function init () {
    initializeBarCharts()
  }

  return {
    init: init
  }

})()

