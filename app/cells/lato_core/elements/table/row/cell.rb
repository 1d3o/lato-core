module LatoCore

  class Elements::Table::Row::Cell < Cell

    @@requested_args = [:labels]

    @@default_args = {
      
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
        @labels = prepare_labels
      end

      def prepare_labels
        prepared_labels = []
        @args[:labels].each do |label|
          if label.is_a?(Hash)
            if ['boolean', 'icon', 'component'].include? label[:type]
              prepared_labels.push({type: label[:type], value: label[:value]})
            else
              prepared_labels.push({type: 'string', value: ''})
            end
          else
            prepared_labels.push({type: 'string', value: label})
          end
        end
        return prepared_labels
      end

  end

end