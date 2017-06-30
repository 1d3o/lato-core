module LatoCore

  class Inputs::Form::Cell < Cell

    @@requested_args = [:url]

    @@default_args = {
      method: 'post',
      remote: false,
      class: ''
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
        @form_method = (@args[:method] === 'get' ? 'get' : 'post')
      end

  end

end