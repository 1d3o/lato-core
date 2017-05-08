module LatoCore

  class Elements::Block::Cell < Cell

    @@requested_args = []

    @@default_args = {
      class: 'md-12',
      round: true
    }

    def initialize(args = {})
      @args = validate_args(
        args: args,
        requested_args: @@requested_args,
        default_args: @@default_args
      )

      set_conditions
    end

    def open(custom_class: nil)
      @args[:class] = custom_class if custom_class
      render 'open.html'
    end
    
    def close
      render 'close.html'
    end

    private

      def set_conditions
        @round_class = @args[:round] ? 'elements-block--round' : ''
      end

  end

end