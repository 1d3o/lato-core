var CoreMediapicker = (function () {

  function initializeDropzone (dropzone) {
    var dropzoneForm = $(dropzone).find('.inputs__dropzone')
    var paramName = $(dropzoneForm).attr('data-param-name')
    var maxFilesize = $(dropzoneForm).attr('data-max-size')
    var maxFiles = $(dropzoneForm).attr('data.max-files')
    $(dropzoneForm).dropzone({
      paramName: paramName,
      maxFilesize: maxFilesize,
      maxFiles: maxFiles
    })
  }

  function initializeGelocalizationMap (geolocalizationMap) {
    var mapContainer = $(geolocalizationMap).find('.inputs-geolocalization__map')[0]
    var searchBoxInput = $(geolocalizationMap).find('.inputs-geolocalization__search')[0]
    var latInput = $(geolocalizationMap).find('.inputs-geolocalization__input-lat')[0]
    var lngInput = $(geolocalizationMap).find('.inputs-geolocalization__input-lng')[0]
    var addressInput = $(geolocalizationMap).find('.inputs-geolocalization__input-address')[0]
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
  }

  function initializeYoutube (youtube) {
    var youtubeInput = $(youtube).find('inputs__input')
    $(youtubeInput).change(function () {
      var inputVal = $(this).val()
      var videoId = _getYoutubeVideoId(inputVal)
      var iframeMarkup = '<iframe src="//www.youtube.com/embed/' + videoId + '" frameborder="0" allowfullscreen></iframe>'
      var videoContainer = $(this).parent().find('.inputs-youtube__video')
      if (inputVal && inputVal !== '') {
        $(videoContainer).html(iframeMarkup)
        $(videoContainer).addClass('inputs-youtube__video--active')
      } else {
        $(videoContainer).html('')
        $(videoContainer).removeClass('inputs-youtube__video--active')
      }
    })
    // trigger initial change
    $(youtubeInput).trigger('change')
  }

  // function to get youtube video
  function _getYoutubeVideoId (url) {
    var regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/
    var match = url.match(regExp)

    if (match && match[2].length === 11) {
      return match[2]
    } else {
      return 'error'
    }
  }

  function _initDropzone () {
    $('.inputs-dropzone').each(function () {
      initializeDropzone(this)
    })
  }

  function _initGeolocalizationMap () {
    $('.inputs-geolocalization').each(function () {
      initializeGeolocalizationMap(this)
    })
  }

  function _initYoutube () {
    $('.inputs-youtube').each(function () {
      initializeYoutube(this)
    })
  }

  // Init:
  function init () {
    _initDropzone()
    _initGeolocalizationMap()
    _initYoutube()
  }

  return {
    init: init,
    initializeDropzone: initializeDropzone,
    initializeGelocalizationMap: initializeGelocalizationMap,
    initializeYoutube: initializeYoutube
  }

})()
  