module LatoCore

  class Elements::Code::Cell < Cell

    @@requested_args = []

    @@default_args = {
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
        # set conditional variables
      end

  end

end