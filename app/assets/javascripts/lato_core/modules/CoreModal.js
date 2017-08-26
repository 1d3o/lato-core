var CoreModal = (function () {

  function open (modalId, event) {
    $('#' + modalId + '.elements-modal').addClass('elements-modal--active')
    setTimeout(function () {
      $('#' + modalId + '.elements-modal').find('.elements-modal__modal').addClass('elements-modal__modal--active')
    }, 500)
    $('body').addClass('stop-scrolling')
    if (event) {
      event.preventDefault()
    }
  }

  function close (modalId, event) {
    $('#' + modalId + '.elements-modal').removeClass('elements-modal--active')
    $('#' + modalId + '.elements-modal').find('.elements-modal__modal').removeClass('elements-modal__modal--active')
    $('body').removeClass('stop-scrolling')
    if (event) {
      event.preventDefault()
    }
  }

  function initializeModalCloseButton (modal) {
    var closeButton = $(modal).find('.elements-modal__close-button')
    $(closeButton).click(function (e) {
      e.preventDefault()
      // close modal
      $(modal).removeClass('elements-modal--active')
      $(modal).find('.elements-modal__modal').removeClass('elements-modal__modal--active')
      // active body scrolling
      $('body').removeClass('stop-scrolling')
    })
  }

  function _initModalCloseButton () {
    $('.elements-modal').each(function () {
      initializeModalCloseButton(this)
    })
  }

  // Init:
  function init () {
    _initModalCloseButton()
  }

  return {
    init: init,
    initializeModalCloseButton: initializeModalCloseButton,
    open: open,
    close: close
  }

})()
