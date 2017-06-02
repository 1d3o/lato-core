module LatoCore

  class Inputs::Dropzone::Cell < Cell

    @@requested_args = [:url]

    @@default_args = {
      param_name: 'file',
      max_size: 2, # MB
      max_files: 99,
      method: 'post',
      label: '',
      remote: false
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
      @show_label = !@args[:label].nil? && !@args[:label].blank?
    end

  end

end
