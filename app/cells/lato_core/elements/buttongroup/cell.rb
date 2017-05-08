module LatoCore

  class Elements::Buttongroup::Cell < Cell

    @@requested_args = [:buttons]

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

    def show
      render 'show.html'
    end

    private

      def set_conditions
        # ...
      end

  end

end