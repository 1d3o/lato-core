var LayoutInitializer = (function () {

  function toggleProfileMenu () {
    $('.layout-admin__profile-container').click(function () {
      // close header widgets
      $('.layout-admin__widget-container').removeClass('layout-admin__widget-container--active')
      // toggle class on profile menu
      $('.layout-admin__profile-menu-list').toggleClass('layout-admin__profile-menu-list--active')
    })
  }

  function toggleWidget () {
    $('.layout-admin__widget-button').click(function (e) {
      var widgetContainer = $(this).parent()
      // close profile menu
      $('.layout-admin__profile-menu-list').removeClass('layout-admin__profile-menu-list--active')
      // close others widgets and toggle on clicked widget
      if ($(widgetContainer).hasClass('layout-admin__widget-container--active')) {
        $('.layout-admin__widget-container').removeClass('layout-admin__widget-container--active')
      } else {
        $('.layout-admin__widget-container').removeClass('layout-admin__widget-container--active')
        $(widgetContainer).addClass('layout-admin__widget-container--active')
      }
      e.preventDefault()
    })
  }

  // Init:

  function init () {
    toggleProfileMenu()
    toggleWidget()
  }

  return {
    init: init
  }

})()