module LatoCore

  class Elements::Flash::Cell < Cell

    @@requested_args = [:message]

    @@default_args = {
      style: nil,
      close: false
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
        # set conditional variables
      end

  end

end