var CoreDatepicker = (function () {

  function initializeDatetime (datetime) {
    var datetimeInput = $(datetime).find('.inputs__input--datetime')
    $(datetimeInput).datetimepicker({
      format: 'd/m/Y H:i'
    })
  }

  function initializeDate (date) {
    var dateInput = $(date).find('.inputs__input--date')
    $(dateInput).datetimepicker({
      timepicker: false,
      format: 'd/m/Y'
    })
  }

  function _initDatetime () {
    $('.inputs-datetime').each(function () {
      initializeDatetime(this)
    })
  }

  function _initDate () {
    $('.inputs-date').each(function () {
      initializeDate(this)
    })
  }
  
  // Init:
  function init () {
    _initDatetime()
    _initDate()
  }

  return {
    init: init,
    initializeDate: initializeDate,
    initializeDatetime: initializeDatetime
  }

})()
