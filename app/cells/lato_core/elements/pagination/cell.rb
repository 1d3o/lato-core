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
        @pages_range_init = generate_pages_range_init
        @pages_range_end = generate_pages_range_end
      end

      # This function generates the first page number to show on the range.
      def generate_pages_range_init
        
      end
      
      # This function generates the last page number to show on the range.
      def generate_pages_range_end

      end

  end

end