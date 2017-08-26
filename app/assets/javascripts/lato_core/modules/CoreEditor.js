var CoreEditor = (function () {
  
    function initializeEditor (editor) {
      var editorInput = $(editor).find('.inputs__editor')
      $(editorInput).trumbowyg({
        svgPath: $('#ddtj__editor-icons-path').html()
      })
    }
  
    function _initEditor () {
      $('.inputs-editor').each(function () {
        initializeEditor(this)
      })
    }
  
    // Init:
    function init () {
      _initEditor()
    }
  
    return {
      init: init,
      initializeEditor: initializeEditor
    }
  
  })()
  