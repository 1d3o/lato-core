module LatoCore

  class Inputs::Date::Cell < Cell

    @@requested_args = [:name]

    @@default_args = {
      value: '',
      label: '',
      placeholder: '',
      help: '',
      required: false,
      disabled: false,
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
      return unless @args[:value]

      if @args[:value].is_a?(DateTime) || @args[:value].is_a?(Time) || @args[:value].is_a?(Date)
        return @args[:value].strftime('%d/%m/%Y')
      end

      @args[:value]
    end

  end

end
