var InputsInitializer = (function () {

  // Init plugins:

  function selectsInitialize () {
    $('.inputs__select').selectize()
  }

  function datetimeInitialize () {
    $('.inputs__input--datetime').datetimepicker({
      format: 'd/m/Y H:i'
    })
  }

  function editorInitialize () {
    $('.inputs__editor').trumbowyg({
      svgPath: $('#ddtj__editor-icons-path').html()
    });
  }

  function dropzoneInitialize () {
    $('.inputs__dropzone').each(function () {
      var paramName = $(this).attr('data-param-name')
      var maxFilesize = $(this).attr('data-max-size')
      var maxFiles = $(this).attr('data.max-files')
      $(this).dropzone({
        paramName: paramName,
        maxFilesize: maxFilesize,
        maxFiles: maxFiles
      })
    })
  }

  // Validations:

  function formInputsValidator () {
    $('.inputs__form').submit(function (e) {
      $(e.target).find('input').each(function () {
        if (!validateInput(this)) { e.preventDefault() }
      })
      $(e.target).find('select').each(function () {
        if (!validateInput(this)) { e.preventDefault() }
      })
      $(e.target).find('textarea').each(function () {
        if (!validateInput(this)) { e.preventDefault() }
      })
    })
  }

  function validateInput (input) {
    if ($(input).attr('data-required') && $(input).attr('data-required') === 'true') {
      if (!validateInputRequired(input)) { return false }
    }

    if ($(input).attr('data-max-length')) {
      if (!validateInputMaxLength(input)) { return false }
    }

    if ($(input).attr('data-min-length')) {
      if (!validateInputMinLength(input)) { return false }
    }

    return true
  }

  function validateInputRequired (input) {
    if ($(input).is(':checkbox')) {
      var inputChecked = $(input).is(':checked')
      if (!inputChecked || inputChecked === null || inputChecked === false) {
        addInputErrorStyle(input)
        return false
      }
    } else {
      var inputValue = $(input).val()
      if (inputValue === null || inputValue === '' || inputValue === ' ') {
        addInputErrorStyle(input)
        return false
      }
    }

    return true
  }

  function validateInputMaxLength (input) {
    var inputValue = $(input).val()
    if (inputValue !== null && inputValue !== '' && inputValue.length > $(input).attr('data-max-length')) {
      addInputErrorStyle(input)
      return false
    }

    return true
  }

  function validateInputMinLength (input) {
    var inputValue = $(input).val()
    if (inputValue !== null && inputValue !== '' && inputValue.length < $(input).attr('data-min-length')) {
      addInputErrorStyle(input)
      return false
    }

    return true
  }

  function addInputErrorStyle (input) {
    if ($(input).is('select')) {
      $(input).next().addClass('inputs__select--error')
      $(input).next().click(function () {
        $(this).removeClass('inputs__select--error')
      })
    } else if ($(input).is('textarea')) {
      $(input).addClass('inputs__textarea--error')
      $(input).click(function () {
        $(this).removeClass('inputs__textarea--error')
      })
    } else {
      $(input).addClass('inputs__input--error')
      $(input).focus(function () {
        $(this).removeClass('inputs__input--error')
      })
    }
  }

  // Init:

  function init () {
    selectsInitialize()
    datetimeInitialize()
    formInputsValidator()
    editorInitialize()
    dropzoneInitialize()
  }

  return {
    init: init,
    dropzoneInitialize: dropzoneInitialize,
    selectsInitialize: selectsInitialize,
    datetimeInitialize: datetimeInitialize,
    editorInitialize: editorInitialize
  }

})()