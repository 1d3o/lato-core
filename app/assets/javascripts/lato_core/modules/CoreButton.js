var CoreButton = (function () {

  function initializeButtonConfirmation (button) {
    var buttonElement = $(button).find('.elements-button__element')
    $(buttonElement).click(function (e) {
      var dataConfirmation = $(this).attr('data-confirmation')
      if (dataConfirmation && dataConfirmation === 'true') {
        e.preventDefault()
        // find confirmation popup
        var confirmation = $(this).parent().find('.elements-button__confirmation')
        // open confirmation popup
        $(confirmation).addClass('elements-button__confirmation--active')
        // manage delete click
        $(confirmation).find('.button.popup.false').click(function (e) {
          $(confirmation).removeClass('elements-button__confirmation--active')
          e.preventDefault()
        })
      }
    })
  }

  function _initButtonConfirmation () {
    $('.elements-button').each(function () {
      initializeButtonConfirmation(this)
    })
  }

  // Init:
  function init () {
    _initButtonConfirmation()
  }

  return {
    init: init,
    initializeButtonConfirmation: initializeButtonConfirmation
  }

})()
