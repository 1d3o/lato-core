# Component under construction.

module LatoCore

  class Elements::Tabs::Cell < Cell

    @@requested_args = []

    @@default_args = {}

    def initialize(args = {})
      @args = validate_args(
        args: args,
        requested_args: @@requested_args,
        default_args: @@default_args
      )

      set_conditions
    end

    private

      def set_conditions
        # ...
      end

  end

end