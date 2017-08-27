var CoreSelect = (function () {

  function initializeSelect (select) {
    var selectInput = $(select).find('.inputs__select')
    $(selectInput).selectize({
      create: $(selectInput).attr('data-create') === 'true',
      maxItems: $(selectInput).attr('data-multiple') === 'true' ? null : 1,
      delimiter: ','
    })
  }

  function initializeMultipleSelect (multipleSelect) {
    var selects =  $(multipleSelect).find('select.inputs__select')
    // manage every select
    selects.each(function (index) {
      _initMultipleSelectSelectize(index, selects)
    })
    // load options for first selectize
    _loadMultipleSelectOptions(null, 0, selects)
  }

  function _initMultipleSelectSelectize (selectPosition, selects) {
    var select = selects[selectPosition]
    var value = $(select).attr('value')
    console.log(value)
    var position = $(select).attr('data-position')
    // clear old selectize
    var selectize = select.selectize
    if (selectize) {
      selectize.destroy()
    }
    // initialize selectize
    $(select).selectize({
      maxItems: 1,
      valueField: 'value',
      labelField: 'label',
      searchField: 'label',
      options: [],
      onChange: function (value) {
        _loadMultipleSelectOptions(value, parseInt(position) + 1, selects)
      },
      onInitialize: function () {
        if (value) {
          this.setValue(value)
          _loadMultipleSelectOptions(value, parseInt(position) + 1, selects)
        }
      }
    })
  }

  function _updateMultipleSelectSelectize (options, selectPosition, selects) {
    var select = selects[selectPosition]
    var value = $(select).attr('value')
    var position = $(select).attr('data-position')

    var selectize = $(select)[0].selectize

    if (selectize) {
      selectize.clear();
      selectize.clearOptions();
      selectize.load(function (callback) {
        callback(options)
      })
      if (value) {
        selectize.setValue(value)
        _loadMultipleSelectOptions(value, parseInt(position) + 1, selects)
      }
    }
  }

  function _loadMultipleSelectOptions (filterValue, selectPosition, selects) {
    var select = selects[selectPosition]
    if (!select) { return }
    var apiUrl = $(select).attr('data-api')
    $.ajax({
      url: apiUrl,
      cache: false,
      data: (filterValue ? {value: filterValue} : null),
      success: function (response) {
        _updateMultipleSelectSelectize(response, selectPosition, selects)
      }
    })
  }

  function _initSelect () {
    $('.inputs-select').each(function () {
      initializeSelect(this)
    })
  }

  function _initMultipleSelect () {
    $('.inputs-multipleselect').each(function () {
      initializeMultipleSelect(this)
    })
  }

  // Init:
  function init () {
    _initSelect()
    _initMultipleSelect()
  }

  return {
    init: init,
    initializeSelect: initializeSelect,
    initializeMultipleSelect: initializeMultipleSelect
  }

})()
  