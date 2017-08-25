var CoreTable = (function () {

  function initializeTableFixedHead (table) {
    var tableElement = $(table).find('.elements-table__table')
    $(tableElement).floatThead({
      scrollContainer: function (table) {
        return table.closest('.elements-table--fixed')
      }
    })
  }
  
  function _initTableFixedHead () {
    $('.elements-table.elements-table--fixed').each(function () {
      initializeTableFixedHead(this)
    })
  }

  // Init:
  function init () {
    _initTableFixedHead()
  }

  return {
    init: init,
    initializeTableFixedHead: initializeTableFixedHead
  }

})()
