var Charts = (function () {

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

  // function initializeCharts () {
  //   var charts = $('.charts-canvas')
  //   charts.each(function () {
  //     initializeChart(this)
  //   })
  // }

  // function initializeChart (canvas) {
  //   var context = canvas.getContext('2d')
  //   var chartType = $(canvas).attr('data-chart-type')

  //   var chart = new Chart(canvas, {
  //     type: chartType,
  //     data: {
  //       labels: ["January", "February", "March", "April", "May", "June", "July"],
  //       datasets: [
  //         { label: 'Dati', data: [20, 10] },
  //         { label: 'Dati 2', data: [3, 14] }
  //       ]
  //     }
  //   })
  // }

  // Init:

  function init () {
    initializeBarCharts()
  }

  return {
    init: init
  }

})()

