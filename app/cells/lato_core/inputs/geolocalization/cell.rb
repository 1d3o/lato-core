module LatoCore

  class Inputs::Geolocalization::Cell < Cell

    @@requested_args = []

    @@default_args = {
      label: '',
      help: '',
      placeholder: '',
      name_lat: 'lat',
      name_lng: 'lng',
      name_address: 'address',
      value_lat: nil,
      value_lng: nil,
      value_address: nil,
      default_lat: 41.90278349999999,
      default_lng: 12.496365500000024,
      default_zoom: 5,
      class: 'md-12',
      default_type: 'roadmap'
    }

    def initialize(args = {})
      @args = validate_args(
        args: args,
        requested_args: @@requested_args,
        default_args: @@default_args
      )

      set_conditions
    end

    def show
      render 'show.html'
    end

    private

    def set_conditions
      @show_label = !@args[:label].nil? && !@args[:label].blank?
      @show_help = !@args[:help].nil? && !@args[:help].blank?
      # geolocalization info
      @default_lat = @args[:value_lat] ? @args[:value_lat] : @args[:default_lat]
      @default_lng = @args[:value_lng] ? @args[:value_lng] : @args[:default_lng]
      @show_marker = @args[:value_lat] && @args[:value_lng]
    end

  end

end
