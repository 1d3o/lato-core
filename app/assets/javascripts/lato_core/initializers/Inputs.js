var InputsInitializer = (function () {

  // Init plugins:

  function initializeSelect () {
    $('.inputs__select').selectize()
  }

  function initializeDatetime () {
    $('.inputs__input--datetime').datetimepicker({
      format: 'd/m/Y H:i'
    })
  }

  function initializeEditor () {
    $('.inputs__editor').trumbowyg({
      svgPath: $('#ddtj__editor-icons-path').html()
    });
  }

  function initializeDropzone () {
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

  function initializeGeolocalizationMap () {
    $('.inputs-geolocalization').each(function () {
      // find dom elements
      var mapContainer = $(this).find('.inputs-geolocalization__map')[0]
      var searchBoxInput = $(this).find('.inputs-geolocalization__search')[0]
      var latInput = $(this).find('.inputs-geolocalization__input-lat')[0]
      var lngInput = $(this).find('.inputs-geolocalization__input-lng')[0]
      var addressInput = $(this).find('.inputs-geolocalization__input-address')[0]
      // initialize map
      var map = new google.maps.Map(mapContainer, {
        zoom: parseInt($(mapContainer).attr('data-default-zoom')),
        center: {
          lat: parseFloat($(mapContainer).attr('data-default-lat')),
          lng: parseFloat($(mapContainer).attr('data-default-lng'))
        },
        mapTypeId: $(mapContainer).attr('data-default-type'),
        streetViewControl: false
      })
      // initialize markers
      var markers = []
      if ($(latInput).val() && $(lngInput).val()) {
        markers.push(new google.maps.Marker({
          map: map,
          position: {lat: parseFloat($(latInput).val()), lng: parseFloat($(lngInput).val())},
          title: $(addressInput).val()
        }))
      }
      // initialize searchbox
      var searchBox = new google.maps.places.SearchBox(searchBoxInput)
      // sync map bounds with search
      map.addListener('bounds_changed', function () {
        searchBox.setBounds(map.getBounds())
      })
      // sync searchbox search with map and hidden inputs
      searchBox.addListener('places_changed', function () {
        // get search palces
        var places = searchBox.getPlaces()
        if (places.length === 0) { return }
        // clean old markers
        markers.forEach(function (marker) { marker.setMap(null) })
        markers = []
        // show first place on map
        var bounds = new google.maps.LatLngBounds()
        var place = places[0]
        if (!place.geometry) { return }
        markers.push(new google.maps.Marker({
          map: map,
          position: place.geometry.location,
          title: place.formatted_address
        }))
        if (place.geometry.viewport) {
          bounds.union(place.geometry.viewport)
        } else {
          bounds.extend(place.geometry.location)
        }
        map.fitBounds(bounds)
        // save place info on hidden inputs
        $(latInput).val(place.geometry.location.lat())
        $(lngInput).val(place.geometry.location.lng())
        $(addressInput).val(place.formatted_address)
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
    initializeSelect()
    initializeDatetime()
    initializeEditor()
    initializeDropzone()
    initializeGeolocalizationMap()
    formInputsValidator()
  }

  return {
    init: init,
    initializeDropzone: initializeDropzone,
    initializeSelect: initializeSelect,
    initializeDatetime: initializeDatetime,
    initializeEditor: initializeEditor,
    initializeGeolocalizationMap: initializeGeolocalizationMap
  }

})()