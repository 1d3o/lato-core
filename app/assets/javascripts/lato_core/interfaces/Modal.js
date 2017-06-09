var Modal = (function () {

  function open (modalId, event) {
    $('#' + modalId + '.elements-modal').addClass('elements-modal--active')
    $('body').addClass('stop-scrolling')
    if (event) {
      event.preventDefault()
    }
  }

  function close (modalId, event) {
    $('#' + modalId + '.elements-modal').removeClass('elements-modal--active')
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