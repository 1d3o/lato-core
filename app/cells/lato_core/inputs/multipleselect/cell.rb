module LatoCore

  class Inputs::Multipleselect::Cell < Cell

    @@requested_args = [:name]

    @@default_args = {
      label: '',
      help: '',
      class: 'md-12',
      selects: [] # {name: '', label: '', api: '', value: '', class: ''}
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

    protected

    def generate_select(select_settings, position)
      LatoCore::Inputs::Select::Cell.new(
        name: "#{@args[:name]}[#{select_settings[:name]}]",
        label: select_settings[:label],
        value: select_settings[:value],
        class: select_settings[:class],
        attributes: {
          api: select_settings[:api],
          position: position
        }
      )
    end

    private

    def set_conditions
      @show_label = !@args[:label].nil? && !@args[:label].blank?
      @show_help = !@args[:help].nil? && !@args[:help].blank?
    end

  end

end
