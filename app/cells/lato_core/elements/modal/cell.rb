module LatoCore

  class Elements::Modal::Cell < Cell

    @@requested_args = [:id, :render]

    @@default_args = {
      title: 'Modal'
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

    def set_conditions; end

  end

end
