var CoreFormValidator = (function () {

  function initializeFormValidation (form) {
    $(form).submit(function (e) {
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
        _addInputErrorStyle(input)
        return false
      }
    } else {
      var inputValue = $(input).val()
      if (inputValue === null || inputValue === '' || inputValue === ' ') {
        _addInputErrorStyle(input)
        return false
      }
    }

    return true
  }

  function validateInputMaxLength (input) {
    var inputValue = $(input).val()
    if (inputValue !== null && inputValue !== '' && inputValue.length > $(input).attr('data-max-length')) {
      _addInputErrorStyle(input)
      return false
    }

    return true
  }

  function validateInputMinLength (input) {
    var inputValue = $(input).val()
    if (inputValue !== null && inputValue !== '' && inputValue.length < $(input).attr('data-min-length')) {
      _addInputErrorStyle(input)
      return false
    }

    return true
  }

  function _addInputErrorStyle (input) {
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

  function _initFormValidation () {
    $('.inputs__form').each(function () {
      initializeFormValidation(this)
    })
  }
  
  // Init:
  function init () {
    _initFormValidation()
  }

  return {
    init: init,
    initializeFormValidation: initializeFormValidation,
    validateInput: validateInput,
    validateInputRequired: validateInputRequired,
    validateInputMaxLength: validateInputMaxLength,
    validateInputMinLength: validateInputMinLength
  }

})()
