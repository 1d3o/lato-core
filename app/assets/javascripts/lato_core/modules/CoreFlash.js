var CoreFlash = (function () {

  function initializeFlashCloseButton (flash) {
    var closeButton = $(flash).find('.elements-flash__close-button')
    $(closeButton).click(function (e) {
      e.preventDefault()
      flash.addClass('elements-flash--hidden')
    })
  }

  function _initFlashCloseButton () {
    $('.elements-flash').each(function () {
      initializeFlashCloseButton(this)
    })
  }

  // Init:
  function init () {
    _initFlashCloseButton()
  }

  return {
    init: init,
    initializeFlashCloseButton: initializeFlashCloseButton
  }

})()
