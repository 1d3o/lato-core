var SortableManager = (function () {
  function initSortable() {
    var sortableContainer = document.querySelector('.js-sortable__main-container')

    if (sortableContainer !== null) {
      var sort = Sortable.create(sortableContainer, {
        animation: 150,
        draggable: '.js-sortable__element',
        onChoose: function (e) {
          console.info('Element is chosen', e)
        },
        onStart: function (e) {
          console.info('Element dragging started', e)
        },
        onEnd: function (e) {
          console.info('Element dragging ended')
          console.info(e.oldIndex)
          console.info(e.newIndex)
        },
        onUpdate: function (e) {
          console.info('onUpdate', e)
      	},
        onSort: function (e) {
          console.info('onSort', e)
        }
      })

      console.info('sortInstance is: ', sort)
    }
  }

  function destroySort(sortInstance) {
    sortInstance.destroy()
  }

  function init () {
    initSortable()
  }

  return {
    init: init,
    destroy: destroySort
  }

})()
