module LatoCore

  class Elements::Table::Container::Cell < Cell

    @@requested_args = []

    @@default_args = {
      border: false,
      fixed: false,
      height: nil
    }

    def initialize(args = {})
      @args = validate_args(
        args: args,
        requested_args: @@requested_args,
        default_args: @@default_args
      )

      set_conditions
    end

    def open
      render 'open.html'
    end
    
    def close
      render 'close.html'
    end

    private

      def set_conditions
        @border_class = @args[:border] ? 'table-border' : ''
        @fixed_class = @args[:fixed] ? 'elements-table--fixed' : ''
        @height_style = @args[:height] ? "height: #{@args[:height]}px" : ''
      end

  end

end