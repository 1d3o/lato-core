var Inputs = (function () {

  // Init plugins:

  function selectsStyle () {
    $('.inputs__select').selectize()
  }

  function datetimeStyle () {
    $('.inputs__input--datetime').datetimepicker({
      format:'d/m/Y H:i'
    })
  }

  function editorStyle () {
    $('.inputs__input--editor').trumbowyg();
  }

  // Validations:

  function formInputsValidator () {
    $('.inputs-form').submit(function (e) {
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

    var inputValue = $(input).val()
    if (inputValue === null || inputValue === '' || inputValue === ' ') {
      addInputErrorStyle(input)
      return false
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
    selectsStyle()
    datetimeStyle()
    formInputsValidator()
    editorStyle()
  }


  return {
    init
  }

})()