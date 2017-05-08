module LatoCore

  class Cell < Cell::Concept

    # set cells directory
    view_paths << "#{LatoCore::Engine.root}/app/cells"

    # include cells dependencies
    include ::Cell::Erb
    include ActionView::Helpers::OutputSafetyHelper

    # This function is used from cells to validates arguments on constructor.
    def validate_args(args: {}, requested_args: [], default_args: {})
      requested_args.each do |requested_arg|
        raise "ERROR" if args[requested_arg] === nil # TODO: Raise a better error
      end

      default_args.each do |key, value|
        args[key] = value if args[key] === nil
      end

      return args
    end

  end

end