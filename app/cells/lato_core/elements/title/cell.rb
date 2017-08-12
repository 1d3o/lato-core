module LatoCore

  class Elements::Title::Cell < Cell

    @@requested_args = [:label]

    @@default_args = {
      size: 1,
      icon: nil
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
      @html_tag = get_html_tag
      @show_icon = @args[:icon] ? true : false
    end

    def get_html_tag
      case @args[:size]
      when 1
        return 'h1'
      when 2
        return 'h2'
      when 3
        return 'h3'
      when 4
        return 'h4'
      when 5
        return 'h5'
      when 6
        return 'h6'
      else
        return 'h1'
      end
    end

  end

end