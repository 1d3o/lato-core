var Modal = (function () {

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

  return {
    open: open,
    close: close
  }

})()