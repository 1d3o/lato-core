var Modal = (function () {

  function open (modalId, event) {
    $('#' + modalId + '.elements-modal').addClass('elements-modal--active')
    if (event) {
      event.preventDefault()
    }
  }

  function close (modalId, event) {
    $('#' + modalId + '.elements-modal').removeClass('elements-modal--active')
    if (event) {
      event.preventDefault()
    }
  }

  return {
    open: open,
    close: close
  }

})()