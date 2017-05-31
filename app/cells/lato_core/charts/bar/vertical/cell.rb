module LatoCore

  class Charts::Bar::Vertical::Cell < Cell

    @@requested_args = [:labels, :datasets]

    @@default_args = {

    }

    def initialize(args = {})
      @args = validate_args(
        args: args,
        requested_args: @@requested_args,
        default_args: @@default_args
      )

      validates_labels
      validates_datasets
      set_conditions
    end

    def show
      render 'show.html'
    end

    private

    def set_conditions
      @metadata = {
        chart_type: 'bar',
        labels: @args[:labels],
        datasets: @args[:datasets]
      }
    end

    def validates_labels
      raise 'Chart labels is not an array' unless @args[:labels].is_a?(Array)
    end

    def validates_datasets
      raise 'Chart datasets is not an array' unless @args[:datasets].is_a?(Array)

      @args[:datasets].each do |dataset|
        validates_dataset(dataset)
      end
    end

    def validates_dataset(dataset)
      raise 'Chart dataset has not a label' unless dataset[:label]
      raise 'Chart dataset data is not an array' unless dataset[:data].is_a?(Array)
      raise 'Chart dataset data length in not correct' unless dataset[:data].length == @args[:labels].length
    end

  end

end
