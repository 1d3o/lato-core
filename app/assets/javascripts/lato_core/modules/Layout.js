var Layout = (function () {

  function toggleProfileMenu() {
    $('.layout-admin__profile-container').click(function (e) {
      $('.layout-admin__profile-menu-list').toggleClass('layout-admin__profile-menu-list--active')
    })
  }

  return {
    toggleProfileMenu
  }

})()