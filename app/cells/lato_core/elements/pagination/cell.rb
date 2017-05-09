module LatoCore

  class Elements::Pagination::Cell < Cell

    @@requested_args = [:total]

    @@default_args = {
      current: 1,
      max_visible: 5,
      url: '#',
      param: 'page'
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
        @prev_page_number = @args[:current] > 1 ? (@args[:current] - 1) : 1
        @next_page_number = @args[:current] < @args[:total] ? (@args[:current] + 1) : @args[:total] 
      end

      # This function generates the first page number to show on the range.
      def generate_pages_range_init
        init_candidate = @args[:current] - (@args[:max_visible] / 2)
        return 1 if init_candidate < 1
        return init_candidate
      end
      
      # This function generates the last page number to show on the range.
      def generate_pages_range_end
        end_candidate = @pages_range_init + @args[:max_visible] -1
        return @args[:total] if end_candidate > @args[:total]
        return end_candidate
      end

      # This function generate the link to go to a specific page number
      def generate_page_link page_number
        if @args[:url][-1] === '&'
          return "#{@args[:url]}#{@args[:param]}=#{page_number}"
        else
          "#{@args[:url]}?#{@args[:param]}=#{page_number}"
        end
      end

  end

end