module LatoCore

  class Inputs::Datetime::Cell < Cell

    @@requested_args = [:name]

    @@default_args = {
      value: '',
      label: '',
      placeholder: '',
      help: '',
      required: false,
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
        @show_help = !@args[:help].nil? && !@args[:help].blank?

        @value = generate_value
      end

      # This function generate the value for the input if it is possible.
      def generate_value
        return if !@args[:value]
        return @args[:value] if !@args[:value].is_a?(DateTime)
        return @args[:value].strftime('%d/%m/%Y %H:%M')
      end

  end

end