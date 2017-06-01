var Elements = (function () {

  function modalCloseButton () {
    $('.elements-modal__close-button').click(function (e) {
      console.log('click')
      var modal = $(this).parent()
      var modalContainer = modal.parent()
      modalContainer.removeClass('elements-modal--active')
      e.preventDefault()
    })
  }

  function flashCloseButton () {
    $('.elements-flash__close-button').click(function (e) {
      var flash = $(this).parent()
      flash.addClass('elements-flash--hidden')
      e.preventDefault()
    })
  }

  function tableHeadFixed () {
    var table = $('.elements-table--fixed .elements-table__table')
    table.floatThead({
      scrollContainer: function (table) {
        return table.closest('.elements-table--fixed')
      }
    })
  }

  function buttonConfirmation () {
    var button = $('.elements-button__element')
    button.click(function (e) {
      if ($(this).attr('data-confirmation') && $(this).attr('data-confirmation') === 'true') {
        var confirmation = $(this).parent().find('.elements-button__confirmation')

        // remove old confirmations popup
        $('.elements-button__element').parent().find('.elements-button__confirmation').removeClass('elements-button__confirmation--active')
        // open confirmation popup
        $(confirmation).addClass('elements-button__confirmation--active')
        // manage delete click
        $(confirmation).find('.button.popup.false').click(function(e) {
          $(confirmation).removeClass('elements-button__confirmation--active')
          e.preventDefault()
        })

        e.preventDefault()
      }
    })
  }

  // Init:

  function init () {
    modalCloseButton()
    flashCloseButton()
    tableHeadFixed()
    buttonConfirmation()
  }

  return {
    init: init
  }

})()

