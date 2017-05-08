module LatoCore

  class Elements::Table::Body::Cell < Cell

    @@requested_args = []

    @@default_args = {
      hover: false
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
        @hover_class = @args[:hover] ? 'elements-table__body--hover' : ''
      end

  end

end