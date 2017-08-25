var MultipleSelect = (function () {

  function initMultipleSelects () {
    var multipleSelects = $('.inputs-multipleselect')
    // initialize every multiple select
    multipleSelects.each(function (index, multipleSelect) {
      _manageMultipleSelect(multipleSelect)
    })
  }

  function _manageMultipleSelect (multipleSelect) {
    var selects =  $(multipleSelect).find('select.inputs__select')
    // manage every select
    selects.each(function (index) {
      _initSelectize(index, selects)
    })
    // load options for first selectize
    _loadOptions(null, 0, selects)
  }

  function _initSelectize (selectPosition, selects) {
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
        _loadOptions(value, parseInt(position) + 1, selects)
      },
      onInitialize: function () {
        if (value) {
          this.setValue(value)
          _loadOptions(value, parseInt(position) + 1, selects)
        }
      }
    })
  }

  function _updateSelectize (options, selectPosition, selects) {
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
        _loadOptions(value, parseInt(position) + 1, selects)
      }
    }
  }

  function _loadOptions (filterValue, selectPosition, selects) {
    var select = selects[selectPosition]
    if (!select) { return }
    var apiUrl = $(select).attr('data-api')
    $.ajax({
      url: apiUrl,
      cache: false,
      data: (filterValue ? {value: filterValue} : null),
      success: function (response) {
        _updateSelectize(response, selectPosition, selects)
      }
    })
  }

  function init () {
    initMultipleSelects()
  }

  return {
    init: init
  }

})()
