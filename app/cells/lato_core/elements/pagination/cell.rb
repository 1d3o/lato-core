module LatoCore

  class Elements::Pagination::Cell < Cell

    @@requested_args = [:total]

    @@default_args = {
      current: 1,
      max_visible: 5
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
        @prev_disabled_class = @args[:current] > 1 ? '' : 'elements-pagination__arrows--disabled'
        @next_disabled_class = @args[:current] < @args[:total] ? '' : 'elements-pagination__arrows--disabled'
      end

  end

end