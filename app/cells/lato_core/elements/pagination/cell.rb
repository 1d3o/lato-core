module LatoCore

  class Elements::Pagination::Cell < Cell

    @@requested_args = [:total]

    @@default_args = {
      current: 1
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