var SortableManager = (function () {
  function initSortable() {
    var sortableContainer = document.querySelectorAll('.js-sortable__main-container')

    if(sortableContainer.length > 0) {
      for (var i = 0; i < sortableContainer.length; i++) {

        var sort = Sortable.create(sortableContainer[i], {
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

            if (e.oldIndex !== e.newIndex) {
              updateOrder(this.el)
            }
          },
          onUpdate: function (e) {
            console.info('onUpdate', e)
        	},
          onSort: function (e) {
            console.info('onSort', e)
          }
        })
      }
    }
  }

  function updateOrder(container) {
    var sortableElements = container.querySelectorAll('.js-sortable__element')
    for (var i = 0; i < sortableElements.length; i++) {
      var sortableElement = sortableElements[i]
      var sortableElementId = sortableElement.dataset.id
      var relativeInput = document.querySelector('.js-sortable__hidden-input[data-id="' + sortableElementId + '"]')

      relativeInput.value = i + 1
      sortableElement.dataset.position = i + 1
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
