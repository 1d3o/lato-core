module LatoCore

  class Elements::Table::Head::Cell < Cell

    @@requested_args = [:labels]

    @@default_args = {
      color: false
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
        @color_class = @args[:color] ? 'elements-table__head--color' : ''
      end

  end

end