module LatoCore

  class Inputs::Geolocalization::Cell < Cell

    @@requested_args = []

    @@default_args = {
      label: '',
      name_lat: 'lat',
      name_lng: 'lng',
      class: 'md-12'
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
    end

  end

end
