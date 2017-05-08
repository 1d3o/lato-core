module LatoCore

  class Inputs::Email::Cell < Cell

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
      end

  end

end