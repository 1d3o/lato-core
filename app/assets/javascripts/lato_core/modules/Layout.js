var Layout = (function () {

  function toggleProfileMenu() {
    $('.layout-admin__profile-container').click(function (e) {
      $('.layout-admin__widget-container').removeClass('layout-admin__widget-container--active')
      $('.layout-admin__profile-menu-list').toggleClass('layout-admin__profile-menu-list--active')
      e.preventDefault()
    })
  }

  function toggleHeaderWidget() {
    $('.layout-admin__widget-button').click(function (e) {
      $('.layout-admin__profile-menu-list').removeClass('layout-admin__profile-menu-list--active')
      $(this).parent().toggleClass('layout-admin__widget-container--active')
      e.preventDefault()
    })
  }

  return {
    toggleProfileMenu,
    toggleHeaderWidget
  }

})()