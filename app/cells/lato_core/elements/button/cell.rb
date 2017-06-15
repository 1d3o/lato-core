module LatoCore

  class Elements::Button::Cell < Cell

    @@requested_args = [:label]

    @@default_args = {
      id: '',
      type: 'link',
      url: '',
      style: '',
      icon: nil,
      icon_align: 'left',
      method: 'get',
      remote: false,
      confirmation: {
        message: nil,
        positive_response: nil,
        negative_response: nil
      },
      onclick: ''
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
      if @args[:type] === 'link'
        render 'link.html'
      elsif @args[:type] === 'button' || @args[:type] === 'submit'
        render 'button.html'
      else
        return
      end
    end

    private

      def set_conditions
        @show_submit = (@args[:type] === 'submit')
        @show_icon = @args[:icon] ? true : false
        @show_method = !(@args[:method] === 'get')
        @show_confirmation = (@args[:confirmation] && @args[:confirmation][:message] &&
                              @args[:confirmation][:positive_response] && 
                              @args[:confirmation][:negative_response])
        @icon_left = (@args[:icon_align] === 'left')
        @icon_right = (@args[:icon_align] === 'right')
      end

  end

end