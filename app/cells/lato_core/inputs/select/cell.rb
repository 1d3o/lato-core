module LatoCore

  class Inputs::Select::Cell < Cell

    @@requested_args = [:name]

    @@default_args = {
      value: '',
      label: '',
      placeholder: '',
      help: '',
      required: false,
      create: false,
      options: [],
      option_value: 'value',
      option_name: 'name',
      option_blank: true,
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
        @options = generate_options
      end

      def generate_options
        options = []
        @args[:options].each do |option|
          if option.is_a?(Hash)
            options.push({value: option[@args[:option_value].to_sym], name: option[@args[:option_name].to_sym]})
          else
            options.push({value: option, name: option})
          end
        end
        return options
      end

  end

end